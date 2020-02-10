Restaurant.destroy_all
User.destroy_all



user = User.create(user_name: "Gian", user_location: "Houston")
restaurant = Restaurant.create(restaurant_name: "Olive Garden", location: "Houston", type_of_food: "Italian")

