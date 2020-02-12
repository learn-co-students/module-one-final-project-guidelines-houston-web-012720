require_relative '../config/environment'
# require_all
$prompt = TTY::Prompt.new

def welcome
    a = Artii::Base.new
    puts a.asciify("Wellcome to Restaurant Search").red
    puts "Please puts your name below"
    name = gets.chomp.split(" ").collect{|name| name.capitalize}.join(" ")
    if !User.pluck(:user_name).include?(name)
        user = User.create(user_name: name)
    else
        user = User.where(user_name: name).take 
    end
    puts "Select option"
    option(user)
end

def select_restaurant(location)
   Restaurant.where('location = ?',location).pluck(:restaurant_name)
end

def get_restaurant_object(name,user)
    restaurant = Restaurant.find_by(restaurant_name: name)
    puts "The restaurant name is #{restaurant.restaurant_name}"
    puts "The location is #{restaurant.location}"
    puts "The restaurant type of food #{restaurant.type_of_food}"
    puts "\n"
    puts "Would you like to add this restaurant into your list (Yes/No)"
    answer = gets.chomp.split(" ").collect{|answer| answer.capitalize}.join(" ")
    while true do
        if answer == "Yes" 
            if !user.restaurants.pluck(:restaurant_name).include?(restaurant.restaurant_name)
                user.add_to_list(restaurant)
                puts "Add to #{restaurant.restaurant_name} to #{user.user_name} list"
                option(user)
            else
                user.print_out_list
                option(user)
            end
            break
        elsif answer == "No"
            option(user)
            break
        else
            puts "Invalid input please inter Yes or No to add restaurant to your lists"
            answer = gets.chomp.split(" ").collect{|answer| answer.capitalize}.join(" ")
        end 
    end
       
end

def list_of_restaurant(list,user)
    input = $prompt.select("abc".blue,list)
    get_restaurant_object(input,user)
end

def search_location(user)
    puts "Hi #{user.user_name}, input your current location."
    location = gets.chomp.split(" ").collect{|location| location.capitalize}.join(" ")
    list_of_restaurant(select_restaurant(location),user)
end

def delete_from_user_list(user)
    if user.lists.length == 0
        puts "You don't have any restaurant inside restaurant lists to delete."
        option(user)
    else
        puts "Please input your restaurant name you want to remove from the list."
        restaurant_name = gets.chomp.split(" ").collect{|name| name.capitalize}.join(" ")
        user.delete_from_lists(restaurant_name)
        user.print_out_list
        option(user)
    end
end

def option(user)
    list = ["View your restaurant lists",
            "Delete restaurant in your lists",
            "Search reataurant location",
            "Exit"
        ]
    input = $prompt.select("abc".blue,list)
    case input
    when list[0]
        user.print_out_list
        option(user)
    when list[1]
        delete_from_user_list(user)
    when list[2]
        search_location(user)
    when list[3]
        puts "Thanks for using our service."
    end
end

# a = Artii::Base.new
# puts a.asciify("Wellcome to Restaurant Search").red
# puts "Please puts your name below"
# name = gets.chomp.split(" ").collect{|name| name.capitalize}.join(" ")
# if !User.pluck(:user_name).include?(name)
#     user = User.create(user_name: name)
# else
#     user = User.where(user_name: name).take 
# end
# puts "Select option"
# option(user)
welcome

