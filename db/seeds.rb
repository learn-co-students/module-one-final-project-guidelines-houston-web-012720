
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

#### ROUTE 13 ################ ID:35
r13 = Area.find_or_create_by(name: "Route 13", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 36, 
                             west_area_id: 34, 
                             pokemon_list: nil,
                             water_list: nil) 

#### ROUTE 14 ################# ID:36
r14 = Area.find_or_create_by(name: "Route 14", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 37, 
                             west_area_id: 35, 
                             pokemon_list: nil,
                             water_list: nil)

##### ROUTE 15 ################### ID:37
r15 = Area.find_or_create_by(name: "Route 15", 
                             north_area_id: 24, 
                             south_area_id: nil, 
                             east_area_id: nil, 
                             west_area_id: 36, 
                             pokemon_list: nil,
                             water_list: nil)

#### SEA ROUTE 19 ############## ID:38
r19 = Area.find_or_create_by(name: "sea Route 19", 
                             north_area_id: 34, 
                             south_area_id: nil, 
                             east_area_id: nil, 
                             west_area_id: 39, 
                             pokemon_list: nil,
                             water_list: nil)

##### SEA FOAM ISLANDS ############# ID:39
fi = Area.find_or_create_by(name: "sEA Foam Island", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 38, 
                             west_area_id: 40, 
                             pokemon_list: nil,
                             water_list: nil)

#### SEA ROUTE 20 ########### ID:40
r20 = Area.find_or_create_by(name: "Sea Route 20", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 39, 
                             west_area_id: 41, 
                             pokemon_list: nil,
                             water_list: nil)

#### CINNABAR ISLAND ############ ID:41
ci = Area.find_or_create_by(name: "Cinnabar Island", 
                             north_area_id: 42, 
                             south_area_id: nill, 
                             east_area_id: 40, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil)

##### SEA ROUTE 21 ############# ID:42
r21 = Area.find_or_create_by(name: "Sea Route 21", 
                             north_area_id: 1, 
                             south_area_id: 41, 
                             east_area_id: nil, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: nil)
