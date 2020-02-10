Restaurant.destroy_all
User.destroy_all
Review.destroy_all


user = User.create(user_name: "Gian", user_location: "Houston")
restaurant = Restaurant.create(restaurant_name: "Olive Garden", location: "Houston", type_of_food: "Italian")
review = Review.create(reviewer_name: "Vien", comments: "This food is amazing, the customer service is nice. The staff is friendly.", restaurant_id: restaurant.id, user_id: user.id)
