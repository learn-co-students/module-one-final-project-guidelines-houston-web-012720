require_relative '../config/environment'
require 'open-uri'




prompt = TTY::Prompt.new
a = Artii::Base.new :font => 'slant'

system ('clear')
puts a.asciify("Cora The Chooser")
# puts "Hello, what do you want to choose?"
options = ["Eat and Drink","Going Out-Entertainment","Sights and Museums","Natural and Geographical","Transport","Accommodations","Leisure and Outdoor","Shopping","Business and Services","Facilities","Areas and Buildings"]
category = prompt.select("Hello, what do you want to choose?", options)
    
    system ('clear')
    puts a.asciify("Cora The Chooser")
puts "You've chosen #{category}, Great!"

remote_ip = open('http://whatismyip.akamai.com').read
puts remote_ip
a = Geokit::Geocoders::MultiGeocoder.geocode(remote_ip)
puts a
puts a.ll