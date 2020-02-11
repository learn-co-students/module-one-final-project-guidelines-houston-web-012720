
r1_pokemon = "16, 19"

pt = Area.create(name: "Pallet Town", north_area_id: 2, south_area_id: nil, pokemon_list: nil)
r1 = Area.create(name: "Route 1", north_area_id: 3, south_area_id: 1, pokemon_list: r1_pokemon)
vc = Area.create(name: "Veridian City", north_area_id: 4, south_area_id: 2, pokemon_list: nil)
r2 = Area.create(name: "Route 2", north_area_id: 5, south_area_id: 3, pokemon_list: nil)
