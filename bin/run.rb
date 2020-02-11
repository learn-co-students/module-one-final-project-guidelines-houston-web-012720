require_relative '../config/environment'
# require_all
$prompt = TTY::Prompt.new

def select_restaurant(location)
   Restaurant.where('location = ?',location).pluck(:restaurant_name)
end

def get_object(name,user)
    a1 = Restaurant.where(restaurant_name: name).take 
    puts "The restaurant name is #{a1.restaurant_name}"
    puts "The location is #{a1.location}"
    puts "The restaurant type of food #{a1.type_of_food}"
    puts "\n"
    puts "Would you like to add this restaurant into your list (Yes/No)"
    answer = gets.chomp
    while true do
        if answer == "Yes" 
            add_to_list(a1,user)
            puts "add to #{user.user_name} list"
            puts "#{user.lists.restaurant.restaurant_name}"
            break
        elsif answer == "No"
            break
        else
            puts "Invalid input please inter Yes or No to add restaurant to your list"
            answer = gets.chomp
        end 
    end
       
end

def list_of_restaurant(list,user)
    input = $prompt.select("abc".blue,list)

    for i in 0...input.length
        if input == list[i]
            get_object(list[i],user)
        end
    end

end

def add_to_list(restaurant,user)
    List.create(restaurant_id: restaurant.id, user_id: user.id)
end

puts "Please puts your name below"
name = gets.chomp
user = User.create(user_name: name)
puts "Hi #{name}, puts your current location."
location = gets.chomp
list_of_restaurant(select_restaurant(location),user)

