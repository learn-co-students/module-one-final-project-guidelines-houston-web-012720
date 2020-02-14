class Page < ActiveRecord::Base
    belongs_to :place
    has_many :matches
    has_many :keywords, through: :matches

    def visit
        Viewer.header
        puts "Checking #{self.url} ..."
        begin
            rawtext = RestClient.get(self.url)
        rescue
            puts "#{self.url} didn't respond."
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
            if link.length < 10
                link = "www.google.com"
            else
                if link.to_s.include?("#")
                    link = link.slice(0,link.index("#"))
                end
                if link.to_s.include?("wp-")
                    link = link.slice(0,link.index("wp-"))
                
                end
                if link.to_s.slice(7,link.length).include?("//")
                    link = link.slice(0,link.slice(7,link.length).index("//")+7)
                
                end
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
                end
            }
        end
    end

end

