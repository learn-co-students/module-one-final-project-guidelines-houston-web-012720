require_relative '../config/environment'
require 'open-uri'




###################### Initial screen, select category

Viewer.header
options = ["Eat and Drink","Going Out-Entertainment","Sights and Museums","Natural and Geographical","Transport","Accommodations","Leisure and Outdoor","Shopping","Business and Services","Facilities","Areas and Buildings"]
if Place.count > 0 && Viewer.prompt.yes?("There is a #{Place.count} places left from a previous search already exist do you want to use it?")
    puts "Using data from the previous search"
else
    category = Viewer.prompt.select("Hello, what do you want to choose?", options)
    puts "You've chosen #{category}, Great!"
    Viewer.header
    APIScrapper.get_data(category)
end


###################### 2nd screen, choose Positive tags
Viewer.header
categories = Tag.get_tag_names
positive_tags = []
while  positive_tags.count < 3 do  #Tag.with_importance.count
    tag = Viewer.prompt.select("Please select tag (positive or negative)", categories)
    positive_tags << tag
    categories = categories - [tag]
    rel = Viewer.prompt.slider('Set the importance of the tag',  min: -100, max: 100, step: 5)
    Viewer.header
end

result = Place.first(10)
Viewer.header
# box = TTY::Box.frame "There will soon be", "Our search results", padding: 3, align: :center, title: {top_left: "Heres the top 10 of your choise", bottom_right: 'v1.0'}, style: {fg: :bright_yellow, bg: :blue, border: { fg: :bright_yellow, bg: :blue}}

table = [["#", "Name", "Address", "Distance"]]

result.each_with_index { |place, index|
    table << [index +1, place.name, place.address.sub!("<br/>", ", ").sub!("<br/>", ", "), place.distance ]
}

t = TTY::Table.new table

#  box = TTY::Box.success(t)
 box = TTY::Box.frame t.render(:ascii), align: :center, title: {top_left: "Heres the top 10 of your choise", bottom_right: 'v1.0'}, style: {fg: :bright_yellow, bg: :blue, border: { fg: :bright_yellow, bg: :blue}}

puts box




