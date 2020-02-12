
class APIScrapper

    @@base_url = "https://places.ls.hereapi.com/places/v1/discover/search?"
    @@api_key = "apiKey=WVM1t25xZdzUizVrVpRsGl4yhHrukBDoFPTMOmReltA"
    @@counter = 0

    def self.get_data(what)

        Tag.destroy_all
        Place.destroy_all
        PlaceTagJoiner.destroy_all
        Page.destroy_all
        Match.destroy_all
        Keyword.destroy_all
        remote_ip = open('http://whatismyip.akamai.com').read
        coordinates = Geokit::Geocoders::MultiGeocoder.geocode(remote_ip)
        url = "#{@@base_url}at=#{coordinates.lat},#{coordinates.lng}&q=#{what}&#{@@api_key}"
        result = JSON.parse(open(url).read)["results"]
        APIScrapper.create_places(result) 
        while result.has_key?("next") do 
            url = result["next"]
            result = JSON.parse(open(url).read)  
            APIScrapper.create_places(result)
            
        end    
        
    end

    def self.create_places(result)
        threads = []
        result["items"].each { |json_part|
            threads << Thread.new(json_part) { |item|
                place = JSON.parse(open(item["href"]).read)  
                if place["contacts"].has_key?("website")
                    website = place["contacts"]["website"][0]["value"]
                else
                    website = nil
                end
                strangehash = {
                    name: place["name"], 
                    distance: item["distance"], 
                    category: place["categories"][0]["title"], 
                    address: place["location"]["address"]["text"],
                    website: website
                }
                tags = []
                if place.has_key?("tags")
                    place["tags"].each { |tag|
                        tags << Tag.find_or_create_by(title: tag["title"],group: tag["group"])
                    }
                end
                if place.has_key?("categories")
                    place["categories"].each { |category|
                        tags << Tag.find_or_create_by(title: category["title"],group: "categories")
                    }
                end
                begin 
                    this = Place.create(strangehash)
                    tags.each { |tag|
                        PlaceTagJoiner.create(place: this, tag: tag)
                    }
                rescue
                    retry
                end
        
            }
        }
        threads.each {|thr| 
            thr.join 
            Viewer.header
            puts "#{Place.count} places scraped from #{Tag.count} categories..."
        }
    end

end

#