
# WATER POKEMON
pt_water_pokemon = "129, 129"
vc_water_pokemon = "129, 129"

# LAND POKEMON
r1_pokemon = "16, 19"
r2_pokemon = "10, 13, 16, 19"
r22_pokemon_list = "19, 21, 29, 30, 56"
r23_pokemon_list = "30, 33, 57, 22, 56"
vr_
dc


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
                             north_area_id: 6, 
                             south_area_id: nil, 
                             east_area_id: 4, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil) 

##### ROUTE 23 ################## ID:6
r23 = Area.find_or_create_by(name: "Route 23", 
                             north_area_id: 7, 
                             south_area_id: 5, 
                             east_area_id: nil, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil)

##### Victory Road ############## ID:7
vr = Area.find_or_create_by(name: "Victory Road", 
                            north_area_id: nil, 
                            south_area_id: 6, 
                            east_area_id: nil, 
                            west_area_id: nil, 
                            pokemon_list: nil,
                            water_list: nil)

##### Diglett's Cave ############## ID:8
dc = Area.find_or_create_by(name: "Diglett's Cave", 
                            north_area_id: nil, 
                            south_area_id: 25, 
                            east_area_id: nil, 
                            west_area_id: 4, 
                            pokemon_list: nil,
                            water_list: nil)

##### Viridian Forest ############## ID:9
vr = Area.find_or_create_by(name: "Viridian Forest", 
                            north_area_id: 10, 
                            south_area_id: 4, 
                            east_area_id: nil, 
                            west_area_id: nil, 
                            pokemon_list: nil,
                            water_list: nil)

##### Pewter City ############## ID:10
pc = Area.find_or_create_by(name: "Pewter City", 
                            north_area_id: nil, 
                            south_area_id: 9, 
                            east_area_id: nil, 
                            west_area_id: 11, 
                            pokemon_list: nil,
                            water_list: nil)

##### Route 3 ############## ID:11
r3 = Area.find_or_create_by(name: "Route 3", 
                            north_area_id: nil, 
                            south_area_id: nil, 
                            east_area_id: 10, 
                            west_area_id: 12, 
                            pokemon_list: nil,
                            water_list: nil)

##### Mt. Moon ############## ID:12
mm = Area.find_or_create_by(name: "Mt. Moon", 
                            north_area_id: nil, 
                            south_area_id: nil, 
                            east_area_id: 13, 
                            west_area_id: 11, 
                            pokemon_list: nil,
                            water_list: nil)

##### Route 4 ############## ID:13
r4 = Area.find_or_create_by(name: "Route 4", 
                            north_area_id: 14, 
                            south_area_id: nil, 
                            east_area_id: 15, 
                            west_area_id: 12, 
                            pokemon_list: nil,
                            water_list: nil)

##### Unknown Dungeon ############## ID:14
ud = Area.find_or_create_by(name: "Unknown Dungeon", 
                            north_area_id: nil, 
                            south_area_id: 13, 
                            east_area_id: nil, 
                            west_area_id: nil, 
                            pokemon_list: nil,
                            water_list: nil)

