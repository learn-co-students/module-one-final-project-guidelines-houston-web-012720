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


###################### 2nd screen, ask for tags tags
Viewer.header
tags = Tag.get_tag_names
positive_tags = []
while  Tag.with_relevance.count < 5 do  
    tag = Viewer.prompt.select("Please select tag (positive or negative)", tags)
    tags = tags - [tag]
    rel =  Viewer.prompt.slider('Set the importance of the tag',  min: -100, max: 100, step: 5)
    Tag.find_by(title: tag).update(relevance: rel)
    Viewer.header
   
    

end

###################### 3rd screeen, ask for keywords
Viewer.header

if Viewer.prompt.yes?("Do you want also add some keywords?")
    exit_condition = false 
    while !exit_condition
        Viewer.header
        key = Viewer.prompt.ask("Type a keyword or press Enter to finish")
        if key
            imp = 0
            imp = Viewer.prompt.slider("Set the importance of the keyword #{key} (set to 0 if typed incorrectly)",  min: -100, max: 100, step: 5)
            if imp != 0
                Keyword.create(keyword: key, importance: imp)
            end
        else
            exit_condition = true
        end
    end
end



result = Place.get_10_most_relevant
Viewer.header
# box = TTY::Box.frame "There will soon be", "Our search results", padding: 3, align: :center, title: {top_left: "Heres the top 10 of your choise", bottom_right: 'v1.0'}, style: {fg: :bright_yellow, bg: :blue, border: { fg: :bright_yellow, bg: :blue}}

table = [["#", "Name", "Address", "Distance","Relevance"]]

result.each_with_index { |place, index|
    table << [index +1, place.name, place.address.sub!("<br/>", ", ").sub!("<br/>", ", "), place.distance, place.relevance ]
}

t = TTY::Table.new table

#  box = TTY::Box.success(t)
 box = TTY::Box.frame t.render(:ascii,align: :center ), align: :center, title: {top_left: "Heres the top 10 of your choise", bottom_right: 'v1.0'}, style: {fg: :bright_yellow, bg: :blue, border: { fg: :bright_yellow, bg: :blue}}

puts box




