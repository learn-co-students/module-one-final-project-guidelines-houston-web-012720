require_relative '../config/environment'
require 'open-uri'


###################### Initial screen, select category
Viewer.header
options = ["Eat and Drink","Going Out-Entertainment","Sights and Museums","Natural and Geographical","Transport","Accommodations","Leisure and Outdoor","Shopping","Business and Services","Facilities","Areas and Buildings"]
use_previous_data = false
data_was_cleared = false
if Place.count > 0 && Viewer.prompt.yes?("#{Place.count} place(s) already exist from the previous search. Would you like to use them?")
    use_previous_data = true
    if Viewer.prompt.yes?("Would you like to reselect preferences?")
        Tag.wipe_relevance
        data_was_cleared = true
    end
else
    data_was_cleared = true
    category = Viewer.prompt.select("Hello, which category are you interested in?\n", options)
    puts "You've chosen #{category}, great!"
    Viewer.header
    APIScrapper.get_data(category)
end


###################### 2nd screen, select tags
Viewer.header
puts "Using data from the previous search" if use_previous_data
tags = Tag.get_tag_names
tags.unshift("DONE SELECTING TAGS")

if data_was_cleared
while Tag.with_relevance.count < 5 do
    tag = Viewer.prompt.select("Which tags are relevant to your search, positively or negatively? Please select up to 5 tags.\n", tags)
    if tag == "DONE SELECTING TAGS"
        break
    end
    rel =  Viewer.prompt.slider('How relevant is this tag?\n',  min: -100, max: 100, step: 5)
    unless rel == 0
        tags -= [tag]
        Tag.find_by(title: tag).update(relevance: rel)
    end
    Viewer.header
end
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

Page.iterate_all_concurrently

###################### 4th screeen, print results

Viewer.header
result = Place.get_10_most_relevant
# box = TTY::Box.frame "There will soon be", "Our search results", padding: 3, align: :center, title: {top_left: "Heres the top 10 of your choise", bottom_right: 'v1.0'}, style: {fg: :bright_yellow, bg: :blue, border: { fg: :bright_yellow, bg: :blue}}

table = [["#", "Name", "Address", "Distance","Relevance"]]

result.each_with_index { |place, index|
    table << [index +1, place.name, place.address.sub!("<br/>", ", ").sub!("<br/>", ", "), place.distance, place.relevance ]
}

t = TTY::Table.new table

#  box = TTY::Box.success(t)
box = TTY::Box.frame t.render(:ascii, align: :center ), align: :center, title: {top_left: "Here are the top 10 results:", bottom_right: 'v1.0'}, style: {fg: :bright_yellow, bg: :blue, border: { fg: :bright_yellow, bg: :blue}}

puts box




