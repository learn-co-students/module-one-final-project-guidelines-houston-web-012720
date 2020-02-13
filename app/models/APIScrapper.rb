
class APIScrapper

    @@base_url = "https://places.ls.hereapi.com/places/v1/discover/search?"
    @@api_key = "apiKey=WVM1t25xZdzUizVrVpRsGl4yhHrukBDoFPTMOmReltA"
    @@counter = 0

    def self.get_data(what, distance)

        Tag.destroy_all
        Place.destroy_all
        PlaceTagJoiner.destroy_all
        Page.destroy_all
        Match.destroy_all
        Keyword.destroy_all
        remote_ip = open('http://whatismyip.akamai.com').read
        coordinates = Geokit::Geocoders::MultiGeocoder.geocode(remote_ip)
        url = "#{@@base_url}in=#{coordinates.lat},#{coordinates.lng};r=#{distance}&q=#{what}&#{@@api_key}"
        result = JSON.parse(open(url).read)["results"]
        APIScrapper.create_places(result) 
        while result.has_key?("next") do 
            url = result["next"]
            result = JSON.parse(open(url).read)  
            APIScrapper.create_places(result)
            
        end    
        
    end

    def self.create_places(result)
        result["items"].each { |item|
                begin
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
                    this = Place.create(strangehash)
                    tags.each { |tag|
                        PlaceTagJoiner.create(place: this, tag: tag)
                    }
                    Viewer.header
                    puts "#{Place.count} places scraped from #{Tag.count} categories..."
                rescue
                    retry
                end
        
            
        }

    end

end

#