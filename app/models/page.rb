class Page < ActiveRecord::Base
    belongs_to :place
    has_many :matches
    has_many :keywords, through: :matches

    def visit
        puts "checking #{self.url}"
        begin
            rawtext = RestClient.get(self.url)
        rescue
            puts "#{self.url} doesn't respond"
            self.update(visited: true)
            return nil
        end
        ##### extract keywords
        Keyword.all.each { |k|
            counter = rawtext.split(k.keyword).count - 1
            if counter > 0 
                Match.create(page_id: self.id, keyword_id: k.id, count: counter)
            end
        }

        #####extract urls
        links = URI::extract(rawtext, "https").uniq
        links = links.map{|link| 
            link = link.to_s
            if link.to_s.include?("#")
                link = link.slice(0,link.rindex("#"))
            end
            if link.to_s.include?("wp-content")
                link = link.slice(0,link.rindex("wp-content"))
                
            end
            link
        }.uniq

        links = links.select{ |link|       
        begin
            self.place.is_internal_link?(link) && !Page.exists?(place_id: self.place_id, url: link)
        rescue
            false
        end
        }

        links.each {|link|
            this_url = Page.find_by(url: link)
            if this_url
                if this_url.place_id != self.place_id
                    newpage = Page.create(place_id: self.place_id, url: link, visited: this_url.visited)
                    this_url.matches.each { |match| 
                        Match.create(page_id: newpage.id, keyword_id: match.keyword_id, count: match.count)
                    }
                end
            end
            if Page.where(place_id: self.place_id).count < 30
                Page.create(place_id: self.place_id, url: link)
            end
        }
        self.update(visited: true)
 
    end

    def self.iterate_all
        Page.delete_all
        Match.delete_all
        places = Place.get_10_most_tag_relevant
        if Keyword.count > 0
            places.select{|place| place.website}.each{ |place|
                page = Page.find_or_create_by(place_id: place.id, url: place.website)
                while Page.where(place_id: place.id, visited: nil).count > 0 
                    Page.where(place_id: place.id, visited: nil).first.visit
                    # binding.pry
                end
            }
        end
    end


    def self.iterate_all_concurrently
        Page.delete_all
        Match.delete_all
        threads = []
        if Keyword.count > 0
            Place.where.not(website: nil).each{ |unvisited_place|
                until threads.map { |t| t.status }.count("run") < 1 do sleep 5 end
                threads << Thread.new(unvisited_place) { |place|
                    page = Page.find_or_create_by(place_id: place.id, url: place.website)
                    while Page.where(place_id: place.id, visited: nil).count > 0
                        begin 
                            Page.where(place_id: place.id, visited: nil).first.visit
                        rescue
                            retry
                        end
                    end
                }
            }
            threads.each {|thr|thr.join}
        end
    end
end

