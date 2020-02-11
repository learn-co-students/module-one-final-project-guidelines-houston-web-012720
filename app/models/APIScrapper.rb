
require 'geokit'
require 'open-uri'
require 'pry'
require 'json'


class APIscrapper

    @@base_url = "https://places.ls.hereapi.com/places/v1/discover/search?"
    @@api_key = "apiKey=WVM1t25xZdzUizVrVpRsGl4yhHrukBDoFPTMOmReltA"

    def self.get_data(what)
        remote_ip = open('http://whatismyip.akamai.com').read
        coordinates = Geokit::Geocoders::MultiGeocoder.geocode(remote_ip)
        url = "#{@@base_url}at=#{coordinates.lat},#{coordinates.lng}&q=#{what}&#{@@api_key}"
        result = JSON.parse(open(url).read)
        result["results"]["items"].each { |item|
            place = JSON.parse(open(item["href"]).read)
            # binding.pry
            if place["contacts"].has_key?("website")
                # binding.pry
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
            puts strangehash
            # binding.pry
            # Place.create(strangehash)
        }

     
    end
end

#