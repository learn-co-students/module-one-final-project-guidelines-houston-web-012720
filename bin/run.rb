require_relative '../config/environment'
require 'open-uri'

def header
    system ('clear')
    puts $pastel.magenta.bold($a.asciify("Cora The Chooser"))
end


prompt = TTY::Prompt.new
$a = Artii::Base.new :font => 'slant'
remote_ip = open('http://whatismyip.akamai.com').read
coordinates = Geokit::Geocoders::MultiGeocoder.geocode(remote_ip)
$pastel = Pastel.new

###################### Initial screen, select category

header
options = ["Eat and Drink","Going Out-Entertainment","Sights and Museums","Natural and Geographical","Transport","Accommodations","Leisure and Outdoor","Shopping","Business and Services","Facilities","Areas and Buildings"]
category = prompt.select("Hello, what do you want to choose?", options)
 
###################### 2nd screen, choose Keywords

header
puts "You've chosen #{category}, Great!"



