require_relative '../config/environment'
# require_all
@prompt = TTY::Prompt.new

def welcome
    a = Artii::Base.new
    puts a.asciify("Welcome to Restaurant Finder").red
    puts "Please enter your name"
    name = gets.chomp.split(" ").collect{|name| name.capitalize}.join(" ")
    User.all.map{|user| user.user_name}.include?(name) ? user = User.find_by(user_name: name) : user = User.create(user_name: name)
    puts "Select option"
    option(user)
end

def select_restaurant(city)
    Restaurant.where(city: city).map{|restaurant| restaurant.restaurant_name}
end

def get_restaurant_object(restaurant_name,user)
    restaurant = Restaurant.find_by(restaurant_name: restaurant_name)
    puts "The restaurant name is #{restaurant.restaurant_name}"
    puts "The restaurant type of food #{restaurant.type_of_food}"
    puts "The city is #{restaurant.city}"
    puts "The address is #{restaurant.address}"
    puts "The available times are #{restaurant.timing}"
    puts "\n"
    answer = @prompt.yes?("Would you like to add this restaurant into your list?")
    user = User.find(user.id)
    if answer
        if user.restaurants.map{|restaurant| restaurant.restaurant_name}.include?(restaurant.restaurant_name)
            puts "You have that restaurant already in your list".green
            user.print_out_list
        else
            puts "#{restaurant.restaurant_name} has now been added to your list!".red
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

def delete_from_user_list(user)
    if user.lists.empty?
        puts "You don't have any restaurant inside your list to delete.".red
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
            "Search restaurant location",
            "Exit"
        ]
    input = @prompt.select("*".green,list)
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
