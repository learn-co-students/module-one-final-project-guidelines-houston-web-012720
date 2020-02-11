# require 'rest-client'
# require 'json'
require 'pry'

Place.destroy_all
Page.destroy_all
Tag.destroy_all

mcdonalds = Place.create(name: "McDonald's")
flatiron = Place.create(name: "Flatiron")

Page.create(url: "www.mcdonalds.com")

Tag.create(title: "Pizza")

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