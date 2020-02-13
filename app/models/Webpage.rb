class Webpage < ActiveRecord::Base
    def self.iterate_all
        Place.where.not(website: nil).each{ |place|
            Webpage.find_or_create_by(domain: place.website, page: place.website)
            while Webpage.where(domain: place.website, visited: nil).count > 0 do
                Webpage.where(domain: place.website, visited: nil).first.visit
            end  
        }
    end

    def visit
        puts "checking #{self.page}"
        begin
            rawtext = RestClient.get(self.page)
        rescue
            puts "#{self.page} doesn't respond"
            self.update(visited: true)
            return nil
        end

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
            self.is_internal_link?(link) && !Webpage.exists?(page: link) && Webpage.where(domain: self.domain).count < 30
        rescue
            false
        end
        }

        links.each {|link|
            Webpage.create(domain: self.domain, page: link)
        }
        begin
            self.update(visited: true,  content: rawtext)
        rescue
            self.update(visited: true)
        end
 
    end

    def is_internal_link?(link)
        exceptions = ["www.facebook.com", "www.google.com"]
        link_host = URI.parse(link).host
        website_host = URI.parse(self.domain).host
        link_host.prepend("www.") unless link_host.starts_with?("www.")
        website_host.prepend("www.") unless website_host.starts_with?("www.")
        website_host == link_host && !exceptions.include?(link_host)
    end

end