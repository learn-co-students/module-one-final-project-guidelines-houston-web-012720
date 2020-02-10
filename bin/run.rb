require_relative '../config/environment'
require 'open-uri'




prompt = TTY::Prompt.new
a = Artii::Base.new :font => 'slant'
remote_ip = open('http://whatismyip.akamai.com').read
coordinates = Geokit::Geocoders::MultiGeocoder.geocode(remote_ip)

###################### Initial screen, select category

system ('clear')
puts a.asciify("Cora The Chooser")
options = ["Eat and Drink","Going Out-Entertainment","Sights and Museums","Natural and Geographical","Transport","Accommodations","Leisure and Outdoor","Shopping","Business and Services","Facilities","Areas and Buildings"]
category = prompt.select("Hello, what do you want to choose?", options)
 
###################### 2nd screen, choose Keywords

system ('clear')
puts a.asciify("Cora The Chooser")
puts "You've chosen #{category}, Great!"


