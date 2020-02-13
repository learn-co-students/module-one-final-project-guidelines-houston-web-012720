# require 'rest-client'
# require 'json'
require 'pry'

Place.destroy_all
Tag.destroy_all
PlaceTagJoiner.destroy_all
Page.destroy_all
Match.destroy_all
Keyword.destroy_all

mcdonalds = Place.create(name: "McDonald's", website: "https://www.mcdonalds.com")
flatiron = Place.create(name: "Flatiron", website: "https://flatironschool.com")
myrestaurant = Place.create(name: "My Restaurant", website: "www.myrestaurant.com")
mynewrestaurant = Place.create(name: "My New Restaurant", website: "http://www.mynewrestaurant.com")

p1 = Page.create(place_id: mcdonalds.id, url: "http://mcdonalds.com/menu")
p2 = Page.create(place_id: mcdonalds.id, url: "http://www.mcdonalds.com/about")
p3 = Page.create(place_id: mcdonalds.id, url: "http://www.mcdonalds.com/locations")
p4 = Page.create(place_id: flatiron.id, url: "https://flatironschool.com/jobs-reports/")
p5 = Page.create(place_id: myrestaurant.id, url: "https://www.myrestaurant.com/a/home")
p6 = Page.create(place_id: myrestaurant.id, url: "https://myrestaurant.com/home")
p7 = Page.create(place_id: myrestaurant.id, url: "http://www.myrestaurant.com/a/home")
p8 = Page.create(place_id: myrestaurant.id, url: "http://myrestaurant.com/a/home")
p9 = Page.create(place_id: mynewrestaurant.id, url: "https://www.mynewrestaurant.com/a/home")
Page.create(place_id: mynewrestaurant.id, url: "http://www.google.com/a/home")

pizza = Tag.create(title: "Pizza", relevance: 70)
burger = Tag.create(title: "Burger", relevance: 30)
fast_food = Tag.create(title: "Fast Food")
bar = Tag.create(title: "Bar", relevance: 0)
wine = Tag.create(title: "Wine", relevance: 2)
italian = Tag.create(title: "Italian", relevance: 9)
japanese = Tag.create(title: "Japanese")
american = Tag.create(title: "American", relevance: -10)

PlaceTagJoiner.create(place_id: mcdonalds.id, tag_id: burger.id)
PlaceTagJoiner.create(place_id: mcdonalds.id, tag_id: fast_food.id)
PlaceTagJoiner.create(place_id: mcdonalds.id, tag_id: american.id)
PlaceTagJoiner.create(place_id: myrestaurant.id, tag_id: pizza.id)

ff = Keyword.create(keyword: "family friendly", relevance: 10)
ff = Keyword.create(keyword: "family friendly", relevance: -9000)
clean = Keyword.create(keyword: "clean", relevance: 25)
veg = Keyword.create(keyword: "vegetarian", relevance: -15)
nice = Keyword.create(keyword: "nice", relevance: 50000)

Match.create(page_id: p1.id, keyword_id: ff.id, count: 2)
Match.create(page_id: p1.id, keyword_id: veg.id, count: 1)
Match.create(page_id: p2.id, keyword_id: ff.id, count: 1)
Match.create(page_id: p3.id, keyword_id: ff.id, count: 3)
Match.create(page_id: p3.id, keyword_id: clean.id, count: 2)
# Match.create(page_id: p3.id, keyword_id: nice.id, count: 1)
Match.create(page_id: p5.id, keyword_id: nice.id, count: 100)
Match.create(page_id: p8.id, keyword_id: veg.id, count: 1)