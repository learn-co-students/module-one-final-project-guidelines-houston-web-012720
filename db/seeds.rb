
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

 ####  CERALEAN CITY ########### ID:15                            
cc = Area.find_or_create_by(name: "Ceralean City", 
                             north_area_id: 17, 
                             south_area_id: 16, 
                             east_area_id: 20, 
                             west_area_id: 13, 
                             pokemon_list: nil,
                             water_list: nil) 

 ####  ROUTE 5 ############## ID:16                           
r5 = Area.find_or_create_by(name: "Route 5", 
                             north_area_id: 15, 
                             south_area_id: nil, 
                             east_area_id: nil, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil) 

###### ROUTE 24 ############# ID:17
r24 = Area.find_or_create_by(name: "Route 24", 
                             north_area_id: nil, 
                             south_area_id: 15, 
                             east_area_id: 18, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil) 

##### ROUTE 25 ############## ID:18
r25 = Area.find_or_create_by(name: "Route 25", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 19, 
                             west_area_id: 17, 
                             pokemon_list: nil,
                             water_list: nil) 

###### BILL'S HOUSE ############# ID:19
bh = Area.find_or_create_by(name: "Bill's House", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 18, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil) 

###### ROUTE 9 ############# ID:20
r9 = Area.find_or_create_by(name: "Route 9", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: nil, 
                             west_area_id: 15, 
                             pokemon_list: nil,
                             water_list: nil) 

####### ROCK TUNNEL ############ ID:21
rt = Area.find_or_create_by(name: "Rock Tunnel", 
                             north_area_id: 20, 
                             south_area_id: 23, 
                             east_area_id: 22, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil) 

######## POWER PLANT ########### ID:22
pp = Area.find_or_create_by(name: "Power Plant", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: nil, 
                             west_area_id: 21, 
                             pokemon_list: nil,
                             water_list: nil) 

####### LARENDER TOWN ########## ID:23
lt = Area.find_or_create_by(name: "Larender Town", 
                             north_area_id: 21, 
                             south_area_id: 24, 
                             east_area_id: nil, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil) 

####### ROUTE 12 ############## ID:24
r12 = Area.find_or_create_by(name: "Route 12", 
                             north_area_id: 23, 
                             south_area_id: nil, 
                             east_area_id: nil, 
                             west_area_id: 25, 
                             pokemon_list: nil,
                             water_list: nil) 

##### ROUTE 11 ############### ID:25
r11 = Area.find_or_create_by(name: "Route 11", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 24, 
                             west_area_id: 26, 
                             pokemon_list: nil,
                             water_list: nil) 

#### VERMILION CITY ########### ID:26
vc = Area.find_or_create_by(name: "Vermilion City", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 25, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil) 

#### ROUTE 13 ################ ID:
r13 = Area.find_or_create_by(name: "Route 13", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 28, 
                             west_area_id: , 
                             pokemon_list: nil,
                             water_list: nil) 