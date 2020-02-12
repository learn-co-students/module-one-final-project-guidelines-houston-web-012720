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

def select_restaurant(city)
    #Grabs the restaurant name from that location of the user and returns an array
     Restaurant.where(city: city).pluck(:restaurant_name)
    # binding.pry
end

def get_restaurant_object(name,user)
    restaurant = Restaurant.find_by(restaurant_name: name)
    puts "The restaurant name is #{restaurant.restaurant_name}"
    puts "The restaurant type of food #{restaurant.type_of_food}"
    puts "The city is #{restaurant.city}"
    puts "The address is #{restaurant.address}"
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
            puts "Invalid input! please enter " + "Yes".red + " or "+ "No".red + " to add restaurant to your lists"
            answer = gets.chomp.split(" ").collect{|answer| answer.capitalize}.join(" ")
        end 
    end
       
end

def list_of_restaurant(list,user)
    input = $prompt.select("abc".blue,list)
    get_restaurant_object(input,user)
end

def search_location(user)
    puts "Hi #{user.user_name}, input your current city."
    city_arr = Restaurant.pluck(:city).uniq
    input = $prompt.select("abc".blue,city_arr)
    list_of_restaurant(select_restaurant(input),user)
end

def delete_from_user_list(user)
    if user.lists.length == 0
        puts "You don't have any restaurant inside restaurant lists to delete.".red
        user.print_out_list
        option(user)
    else
        user.print_out_list
        puts "Please input your restaurant id you want to remove from the list."
        id = gets.chomp
        user.delete_from_lists(id)
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



# puts "Please puts your name below"
# name = gets.chomp
# user = User.create(user_name: name)
# puts "Hi #{name}, puts your current location."
# location = gets.chomp
# list_of_restaurant(select_restaurant(location))
welcome 
