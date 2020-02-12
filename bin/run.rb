require_relative '../config/environment'
# require_all
$prompt = TTY::Prompt.new

def welcome
    a = Artii::Base.new :font => 'slant'
    puts a.asciify("Wellcome to Restaurant Search").red
    puts "Please puts your name below"
    name = gets.chomp.split(" ").collect{|name| name.capitalize}.join(" ")
    User.all.map{|user| user.user_name}.include?(name) ? user = User.where(user_name: name).take : user = User.create(user_name: name) 
    puts "Select option"
    option(user)
end

def select_restaurant(city)
    #Grabs the restaurant name from that location of the user and returns an array
     Restaurant.where(city: city).pluck(:restaurant_name)
end

def get_restaurant_object(restaurant_name,user)
    restaurant = Restaurant.find_by(restaurant_name: restaurant_name)
    puts "\n"
    puts "|---------------------------------------------------------------------------------------------|"
    puts "|" + "                #{restaurant.restaurant_name}".blue
    puts "|\n"
    puts "|     Location:"
    puts "|         #{restaurant.address}"
    puts "|         #{restaurant.city}"
    puts "|     Cuisines:"
    puts "|         #{restaurant.type_of_food}"
    puts "|\n"
    puts "|---------------------------------------------------------------------------------------------|"
    puts "\n"
    answer = $prompt.yes?("Would you like to add this restaurant into your list")
    if answer
        user = User.find(user.id)
        if user.restaurants.map{|restaurant| restaurant.restaurant_name}.include?(restaurant.restaurant_name)
            puts "This restaurant is already in your list".red
            user.print_out_list
        else
            puts "Add to #{restaurant.restaurant_name} to #{user.user_name} list".green
            user.add_to_list(restaurant) 
        end
        option(user)
    else 
        option(user)
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
        puts "Id: #{id} is now deleted off your list".green
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

welcome 
