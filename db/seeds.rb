
# WATER POKEMON
pt_water_pokemon = "129, 129"
vc_water_pokemon = "129, 129"

# LAND POKEMON
r1_pokemon = "16, 19"
r2_pokemon = "10, 13, 16, 19"

##### PALLET TOWN ###############
pt = Area.find_or_create_by(name: "Pallet Town", 
                            north_area_id: 2,
                            south_area_id: nil, 
                            east_area_id: nil, 
                            west_area_id: nil, 
                            pokemon_list: nil,
                            water_list: pt_water_pokemon)

##### ROUTE 1 ###################
r1 = Area.find_or_create_by(name: "Route 1", 
                            north_area_id: 3, 
                            south_area_id: 1, 
                            east_area_id: nil, 
                            west_area_id: nil, 
                            pokemon_list: r1_pokemon,
                            water_list: nil)

##### VIRIDIAN CITY ############# ID:3
vc = Area.find_or_create_by(name: "Viridian City", 
                            north_area_id: 4, 
                            south_area_id: 2, 
                            east_area_id: nil, 
                            west_area_id: nil, 
                            pokemon_list: nil,
                            water_list: vc_water_pokemon)

##### ROUTE 2 ################### ID:4
r2 = Area.find_or_create_by(name: "Route 2", 
                            north_area_id: nil, 
                            south_area_id: 3, 
                            east_area_id: nil, 
                            west_area_id: 5, 
                            pokemon_list: r2_pokemon,
                            water_list: vc_water_pokemon)

##### ROUTE 22 ################## ID:5
r22 = Area.find_or_create_by(name: "Route 22", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 4, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil) 
