require_relative '../config/environment'
# require_all
@prompt = TTY::Prompt.new

def select_restaurant(location)
    #Grabs the restaurant name from that location of the user and returns an array
     Restaurant.where(location: location).pluck(:restaurant_name)
    # binding.pry
end

def restaurants(name)
    #grabs the first restaurant name of name being passed
    restaurant = Restaurant.where(restaurant_name: name).take 

    # grabs the name,location and type of food from restaurant
    puts "The restaurant name is #{restaurant.restaurant_name}"
    puts "The location is #{restaurant.location}"
    puts "The restaurant type of food #{restaurant.type_of_food}"
end

def list_of_restaurant(list_of_restaurant_name)
    input = @prompt.select("abc".blue,list_of_restaurant_name)
    restaurants(input)

end

def add_to_list(restaurant,user)
    
    list = List.create(restaurant_id: restaurant.id, user_id: user.id)
    l
end


puts "Please puts your name below"
name = gets.chomp
user = User.create(user_name: name)
puts "Hi #{name}, puts your current location."
location = gets.chomp
list_of_restaurant(select_restaurant(location))

