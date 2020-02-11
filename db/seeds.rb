Place.destroy_all
Page.destroy_all

mcdonalds = Place.create(name: "McDonald's")
flatiron = Place.create(name: "Flatiron")

Page.create(url: "www.mcdonalds.com")