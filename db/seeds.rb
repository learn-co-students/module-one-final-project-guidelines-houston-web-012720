# Restaurant.destroy_all
# User.destroy_all
# List.destroy_all



# Restaurant.create(restaurant_name: "Olive Garden", location: "Houston", type_of_food: "Italian")
# Restaurant.create(restaurant_name: "Indigo", location: "Houston", type_of_food: "Italian")
# Restaurant.create(restaurant_name: "La Lucha", location: "Houston", type_of_food: "Mexican")
# Restaurant.create(restaurant_name: "Coltivare Piza & Garden", location: "Conroe", type_of_food: "Italian")
# Restaurant.create(restaurant_name: "BB's Tex-Orleans", location: "Conroe", type_of_food: "Southern")
# Restaurant.create(restaurant_name: "Nancy's Hustle", location: "Conroe", type_of_food: "breakfast")
# Restaurant.create(restaurant_name: "Uchi", location: "Austin", type_of_food: "Japanese")
# Restaurant.create(restaurant_name: "Fonda San Miguel", location: "Austin", type_of_food: "Mexican")
# Restaurant.create(restaurant_name: "Jeffery's", location: "Austin", type_of_food: "American")
# Restaurant.create(restaurant_name: "Valentina's Tex Mex", location: "Austin", type_of_food: "Mexican")

# houston_url = 'https://developers.zomato.com/api/v2.1/search?entity_id=277&entity_type=city&collection_id=1'
# austin_url = "https://developers.zomato.com/api/v2.1/search?entity_id=278&entity_type=city"
# dallas_url = "https://developers.zomato.com/api/v2.1/search?entity_id=276&entity_type=city"

#  response1 = RestClient.get(houston_url, headers={'user-key': "a9252d17baa2869cc9fb47f0db114837"})
#  restaurant1 = JSON.parse(response1)
#  restaurant1["restaurants"].each do |restaurant|
#     name = restaurant["restaurant"]["name"]
#     city = restaurant["restaurant"]["location"]["city"]
#     address = restaurant["restaurant"]["location"]["address"]
#     cuisines = restaurant["restaurant"]["cuisines"]
#     timing = restaurant["restaurant"]["timings"]
#     Restaurant.create(restaurant_name: name, city: city, address: address, type_of_food: cuisines, timing: timing)
#  end


#  response2 = RestClient.get(austin_url, headers={'user-key': "a9252d17baa2869cc9fb47f0db114837"})
#  restaurant2 = JSON.parse(response2)
#  restaurant2["restaurants"].each do |restaurant|
#     name = restaurant["restaurant"]["name"]
#     city = restaurant["restaurant"]["location"]["city"]
#     address = restaurant["restaurant"]["location"]["address"]
#     cuisines = restaurant["restaurant"]["cuisines"]
#     timing = restaurant["restaurant"]["timings"]
#     Restaurant.create(restaurant_name: name, city: city, address: address, type_of_food: cuisines, timing: timing)
#  end

#  response3 = RestClient.get(dallas_url, headers={'user-key': "a9252d17baa2869cc9fb47f0db114837"})
#  restaurant3 = JSON.parse(response3)
#  restaurant3["restaurants"].each do |restaurant|
#     name = restaurant["restaurant"]["name"]
#     city = restaurant["restaurant"]["location"]["city"]
#     address = restaurant["restaurant"]["location"]["address"]
#     cuisines = restaurant["restaurant"]["cuisines"]
#     timing = restaurant["restaurant"]["timings"]
#     Restaurant.create(restaurant_name: name, city: city, address: address, type_of_food: cuisines, timing: timing)
#  end