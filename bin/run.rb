require_relative '../config/environment'
# require_all
##
@prompt = TTY::Prompt.new
@a = Artii::Base.new

def welcome
    puts @a.asciify("Welcome to Restaurant Finder").green
    puts "Please enter your name"
    name = gets.chomp.split(" ").collect{|name| name.capitalize}.join(" ")
    while name == ""
        puts "You have enter nothing".red + ", please enter your name"
        name = gets.chomp.split(" ").collect{|name| name.capitalize}.join(" ")
    end

    User.all.map{|user| user.user_name}.include?(name) ? user = User.find_by(user_name: name) : user = User.create(user_name: name)
    puts "Select option"
    option(user)
end

def select_restaurant(city)
    Restaurant.where(city: city).map{|restaurant| restaurant.restaurant_name}
end

def get_restaurant_object(restaurant_name,user)
    restaurant = Restaurant.find_by(restaurant_name: restaurant_name)
    puts "|------------------------------------------------------------------------------------------------|"
    puts "|"+"                   #{restaurant.restaurant_name}".green
    puts "|\n"
    puts "|       Location:"
    puts "|"+"             #{restaurant.address}".green
    puts "|       Cuisienes:"
    puts "|"+"             #{restaurant.type_of_food}".green
    puts "|       Timings:"
    puts "|"+"             #{restaurant.timing}".green
    puts "|\n"
    puts "|-------------------------------------------------------------------------------------------------|"
    answer = @prompt.yes?("Would you like to add this restaurant into your list?")
    # user = User.find(user.id)
    if answer
        if user.restaurants.map{|restaurant| restaurant.restaurant_name}.include?(restaurant.restaurant_name)
            puts "You have that restaurant already in your list".red
            user.print_out_list
        else
            puts "#{restaurant.restaurant_name} has now been added to your list!".green
            user.add_to_list(restaurant)
        end 
        option(user)
    else
        option(user)
         
    end
   
end

def list_of_restaurant(list,user)
    input = @prompt.select("*".blue,list)
    get_restaurant_object(input,user)
end

def search_location(user)
    puts "Hi #{user.user_name}, select your current city."
    city_arr = Restaurant.all.map{|restaurant| restaurant.city}.uniq
    input = @prompt.select("*".blue,city_arr)
    list_of_restaurant(select_restaurant(input),user)
end

def delete_function(user)
    if user.restaurants.empty?
        puts "You don't have any restaurant inside your list to delete.".red
        user.print_out_list
        option(user)
    else
        user.print_out_list
        list = ["Clear restaurant by Id", "Clear all restaurants by location","Clear all your restaurants from lists","Exit"]
        input = @prompt.select("*".blue,list)
        case input 
        when list[0]
            clear_restaurant_by_id(user)
            option(user)
        when list[1]
            clear_all_restaurant_by_location(user)
            puts "You have removed all restaurants from that location".red
            option(user)
        when list[2]
            user.clear_table
            puts "You cleared everything from your list".red
            option(user)
        when list[3]
            option(user)
        end
    end
end

def clear_all_restaurant_by_location(user)
    puts "Select city you want to delete from list"
    list = user.restaurants.pluck(:city).uniq
    input = @prompt.select("*".blue,list)
    user.delete_all_restaurant_by_location(input)
end

def clear_restaurant_by_id(user)
    
    puts "Please input your restaurant id you want to remove from the list."
    id = gets.chomp.to_i
    if user.restaurants.map{|restaurant| restaurant.id}.include?(id)
        user.delete_from_lists(id)
        puts "Id: #{id} is now deleted off your list".red
    else
        puts "Invalid input !".red
        clear_restaurant_by_id(user)
    end
end

def option(user)
    user = User.find(user.id)
    list = ["View your restaurant lists",
            "Delete restaurant in your lists",
            "Search restaurant location",
            "Welcome",
            "Exit"
        ]
    input = @prompt.select("*".green,list)
    case input
    when list[0]
        user.print_out_list
        option(user)
    when list[1]
        delete_function(user)
    when list[2]
        search_location(user)
    when list[3]
        welcome
    when list[4]
        puts @a.asciify("Thanks for using our service !").green
    end
end

welcome 
