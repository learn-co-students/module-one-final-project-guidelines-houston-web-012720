# require 'rest-client'
# require 'json'
require 'pry'

Place.destroy_all
Page.destroy_all
Tag.destroy_all
PlaceTagJoiner.destroy_all

mcdonalds = Place.create(name: "McDonald's", website: "https://www.mcdonalds.com")
flatiron = Place.create(name: "Flatiron", website: "https://flatironschool.com")
mynewrestaurant = Place.create(name: "My New Restaurant", website: "http://www.mynewrestaurant.com")

Page.create(place_id: mcdonalds.id, url: "http://mcdonalds.com/menu")
Page.create(place_id: mcdonalds.id, url: "http://www.mcdonalds.com/about")
Page.create(place_id: mcdonalds.id, url: "http://www.mcdonalds.com/locations")
Page.create(place_id: flatiron.id, url: "https://flatironschool.com/jobs-reports/")
Page.create(place_id: mynewrestaurant.id, url: "https://www.mynewrestaurant.com/a/home")
Page.create(place_id: mynewrestaurant.id, url: "https://mynewrestaurant.com/home")
Page.create(place_id: mynewrestaurant.id, url: "http://www.mynewrestaurant.com/a/home")
Page.create(place_id: mynewrestaurant.id, url: "http://mynewrestaurant.com/a/home")
Page.create(place_id: mynewrestaurant.id, url: "http://www.google.com/a/home")



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


