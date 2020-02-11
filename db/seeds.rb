# require 'rest-client'
# require 'json'
require 'pry'

Place.destroy_all
Page.destroy_all
Tag.destroy_all
PlaceTagJoiner.destroy_all

mcdonalds = Place.create(name: "McDonald's")
flatiron = Place.create(name: "Flatiron")

Page.create(url: "www.mcdonalds.com")

pizza = Tag.create(title: "Pizza")
burger = Tag.create(title: "Burger")
fast_food = Tag.create(title: "Fast Food")
bar = Tag.create(title: "Bar", relevance: 0)
wine = Tag.create(title: "Wine", relevance: 2)
italian = Tag.create(title: "Italian", relevance: 9)
japanese = Tag.create(title: "Japanese")
american = Tag.create(title: "American", relevance: -4)

PlaceTagJoiner.create(place_id: mcdonalds.id, tag_id: burger.id)
PlaceTagJoiner.create(place_id: mcdonalds.id, tag_id: fast_food.id)


# response = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=ruby+programming", headers={})
# books = JSON.parse(response)

# books["items"].each do |book|
#     if book["authors"]
#         a = Author.create(name: book["authors"][0])
#     else
#         a = Author.create(name: "N/A")
#     end
#     Book.create{title: book["volumeInfo"][:title], year: book["volumeInfo"]["publishedDate"], author_id: a.id}
# end

# binding.pry
# 0