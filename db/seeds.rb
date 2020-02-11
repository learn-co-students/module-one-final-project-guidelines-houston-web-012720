Restaurant.destroy_all
# User.destroy_all
# Review.destroy_all



Restaurant.create(restaurant_name: "Olive Garden", location: "Houston", type_of_food: "Italian")
Restaurant.create(restaurant_name: "Indigo", location: "Houston", type_of_food: "Italian")
Restaurant.create(restaurant_name: "La Lucha", location: "Houston", type_of_food: "Mexican")
Restaurant.create(restaurant_name: "Coltivare Piza & Garden", location: "Conroe", type_of_food: "Italian")
Restaurant.create(restaurant_name: "BB's Tex-Orleans", location: "Conroe", type_of_food: "Southern")
Restaurant.create(restaurant_name: "Nancy's Hustle", location: "Conroe", type_of_food: "breakfast")
Restaurant.create(restaurant_name: "Uchi", location: "Austin", type_of_food: "Japanese")
Restaurant.create(restaurant_name: "Fonda San Miguel", location: "Austin", type_of_food: "Mexican")
Restaurant.create(restaurant_name: "Jeffery's", location: "Austin", type_of_food: "American")
Restaurant.create(restaurant_name: "Valentina's Tex Mex", location: "Austin", type_of_food: "Mexican")


response = RestClient.get('https://developers.zomato.com/api/v2.1/search?entity_id=277&entity_type=city&collection_id=1


', headers={'user-key': "a9252d17baa2869cc9fb47f0db114837"})
 parsed_data = JSON.parse(response)
 binding.pry
 0