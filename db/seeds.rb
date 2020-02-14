
# WATER POKEMON
pt_water_pokemon = "129"
vc_water_pokemon = "129"
cc_water_pokemon = "60, 118, 129"
ud_water_pokemon = "80, 99, 117, 119"
r24_water_pokemon = "98, 118, 54"
r25_water_pokemon = "98, 118, 54"
r12_water_pokemon = "129"
r11_water_pokemon = "60, 118"
vec_water_pokemon = "129"
r6_water_pokemon = "129"
cec_water_pokemon = "61, 79"
r17_water_pokemon = "129"
r18_water_pokemon = "61, 79, 129"
fc_water_pokemon = "129, 130"
r19_pokemon_list = "72"
r20_water_pokemon = "72"
si_water_pokemon = "120, 121"
r21_water_pokemon = "72, 73"

# LAND POKEMON
r1_pokemon = "16, 19"
r2_pokemon = "10, 13, 16, 19"
r22_pokemon_list = "19, 21, 29, 30, 56"
r23_pokemon_list = "30, 33, 57, 22, 56"
vr_pokemon_list = "67, 74, 75, 95, 41, 42, 146"
dc_pokemon_list = "50, 51, 1"
vf_pokemon_list = "10, 11, 13, 14, 17, 25"
r3_pokemon_list = "16, 21, 39"
mm_pokemon_list = "41, 74, 46, 35, 78"
r4_pokemon_list = "27, 21, 19, 23"
ud_pokemon_list = "42, 64, 82, 85, 97, 112, 132, 49, 47, 28, 26, 24, 150"
r5_pokemon_list = "69, 56, 52, 43, 16"
r24_pokemon_list = "10, 11, 13, 14, 16, 63, 4"
r25_pokemon_list = "10, 11, 13, 14, 16, 63"
r9_pokemon_list = "19, 21, 27, 23, 109, 110"
rt_pokemon_list = "41, 74, 66, 95, 7"
pp_pokemon_list = "100, 25, 81, 82, 26, 125, 145"
r12_pokemon_list = "43, 69, 16, 48, 44, 70"
r11_pokemon_list = "23, 27, 21, 96, 2"
r6_pokemon_list = "43, 16, 56, 52, 26, 5"
r7_pokemon_list = "52, 16, 43, 56, 58, 37, 65"
cec_pokemon_list = "133, 151, 8"
r16_pokemon_list = "21, 19, 84, 20, 22, 143"
r17_pokemon_list = "20, 21, 22, 84, 77, 102, 103"
r18_pokemon_list = "20, 21, 22, 84, 123, 111"
r13_pokemon_list = "16, 17, 132, 43, 44, 48, 3"
r14_pokemon_list = "16, 17, 132, 43, 44, 48, 6"
r15_pokemon_list = "16, 17, 132, 43, 44, 48, 9"
si_pokemon_list = "144, 41, 42, 98, 99, 86, 87"
r21_pokemon_list = "100, 115, 114, 76, 88, 89, 87, 147, 148, 149"

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
                            north_area_id: 9, 
                            south_area_id: 3, 
                            east_area_id: 8, 
                            west_area_id: 5, 
                            pokemon_list: r2_pokemon,
                            water_list: vc_water_pokemon)

##### ROUTE 22 ################## ID:5
r22 = Area.find_or_create_by(name: "Route 22", 
                             north_area_id: 6, 
                             south_area_id: nil, 
                             east_area_id: 4, 
                             west_area_id: nil, 
                             pokemon_list: r22_pokemon_list,
                             water_list: nil) 

##### ROUTE 23 ################## ID:6
r23 = Area.find_or_create_by(name: "Route 23", 
                             north_area_id: 7, 
                             south_area_id: 5, 
                             east_area_id: nil, 
                             west_area_id: nil, 
                             pokemon_list: r23_pokemon_list,
                             water_list: nil)

##### Victory Road ############## ID:7
vr = Area.find_or_create_by(name: "Victory Road", 
                            north_area_id: nil, 
                            south_area_id: 6, 
                            east_area_id: nil, 
                            west_area_id: nil, 
                            pokemon_list: vr_pokemon_list,
                            water_list: nil)

##### Diglett's Cave ############## ID:8
dc = Area.find_or_create_by(name: "Diglett's Cave", 
                            north_area_id: nil, 
                            south_area_id: 25, 
                            east_area_id: nil, 
                            west_area_id: 4, 
                            pokemon_list: dc_pokemon_list,
                            water_list: nil)

##### Viridian Forest ############## ID:9
vf = Area.find_or_create_by(name: "Viridian Forest", 
                            north_area_id: 10, 
                            south_area_id: 4, 
                            east_area_id: nil, 
                            west_area_id: nil, 
                            pokemon_list: vf_pokemon_list,
                            water_list: nil)

##### Pewter City ############## ID:10
pc = Area.find_or_create_by(name: "Pewter City", 
                            north_area_id: nil, 
                            south_area_id: 9, 
                            east_area_id: 11, 
                            west_area_id: nil, 
                            pokemon_list: nil,
                            water_list: nil)

##### Route 3 ############## ID:11
r3 = Area.find_or_create_by(name: "Route 3", 
                            north_area_id: nil, 
                            south_area_id: nil, 
                            east_area_id: 12, 
                            west_area_id: 10, 
                            pokemon_list: r3_pokemon_list,
                            water_list: nil)

##### Mt. Moon ############## ID:12
mm = Area.find_or_create_by(name: "Mt. Moon", 
                            north_area_id: nil, 
                            south_area_id: nil, 
                            east_area_id: 13, 
                            west_area_id: 11, 
                            pokemon_list: mm_pokemon_list,
                            water_list: nil)

##### Route 4 ############## ID:13
r4 = Area.find_or_create_by(name: "Route 4", 
                            north_area_id: 14, 
                            south_area_id: nil, 
                            east_area_id: 15, 
                            west_area_id: 12, 
                            pokemon_list: r4_pokemon_list,
                            water_list: nil)

##### Unknown Dungeon ############## ID:14
ud = Area.find_or_create_by(name: "Unknown Dungeon", 
                            north_area_id: nil, 
                            south_area_id: 13, 
                            east_area_id: nil, 
                            west_area_id: nil, 
                            pokemon_list: ud_pokemon_list,
                            water_list: ud_water_pokemon)

 ####  CERALEAN CITY ########### ID:15                            
cec = Area.find_or_create_by(name: "Ceralean City", 
                             north_area_id: 17, 
                             south_area_id: 16, 
                             east_area_id: 20, 
                             west_area_id: 13, 
                             pokemon_list: cec_pokemon_list,
                             water_list: cec_water_pokemon) 

 ####  ROUTE 5 ############## ID:16                           
r5 = Area.find_or_create_by(name: "Route 5", 
                             north_area_id: 15, 
                             south_area_id: nil, 
                             east_area_id: nil, 
                             west_area_id: nil, 
                             pokemon_list: r5_pokemon_list,
                             water_list: nil) 

###### ROUTE 24 ############# ID:17
r24 = Area.find_or_create_by(name: "Route 24", 
                             north_area_id: nil, 
                             south_area_id: 15, 
                             east_area_id: 18, 
                             west_area_id: nil, 
                             pokemon_list: r24_water_pokemon,
                             water_list: r24_water_pokemon) 

##### ROUTE 25 ############## ID:18
r25 = Area.find_or_create_by(name: "Route 25", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 19, 
                             west_area_id: 17, 
                             pokemon_list: r25_pokemon_list,
                             water_list: r25_water_pokemon) 

###### BILL'S HOUSE ############# ID:19
bh = Area.find_or_create_by(name: "Bill's House", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: nil, 
                             west_area_id: 18, 
                             pokemon_list: nil,
                             water_list: nil) 

###### ROUTE 9 ############# ID:20
r9 = Area.find_or_create_by(name: "Route 9", 
                             north_area_id: nil, 
                             south_area_id: 21, 
                             east_area_id: nil, 
                             west_area_id: 15, 
                             pokemon_list: r9_pokemon_list,
                             water_list: nil) 

####### ROCK TUNNEL ############ ID:21
rt = Area.find_or_create_by(name: "Rock Tunnel", 
                             north_area_id: 20, 
                             south_area_id: 23, 
                             east_area_id: 22, 
                             west_area_id: nil, 
                             pokemon_list: rt_pokemon_list,
                             water_list: nil) 

######## POWER PLANT ########### ID:22
pp = Area.find_or_create_by(name: "Power Plant", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: nil, 
                             west_area_id: 21, 
                             pokemon_list: pp_pokemon_list,
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
                             pokemon_list: r12_pokemon_list,
                             water_list: r12_water_pokemon) 

##### ROUTE 11 ############### ID:25
r11 = Area.find_or_create_by(name: "Route 11", 
                             north_area_id: 8, 
                             south_area_id: nil, 
                             east_area_id: 24, 
                             west_area_id: 26, 
                             pokemon_list: r11_pokemon_list,
                             water_list: r11_water_pokemon) 

#### VERMILION CITY ########### ID:26
vec = Area.find_or_create_by(name: "Vermilion City", 
                             north_area_id: 27, 
                             south_area_id: nil, 
                             east_area_id: 25, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: vec_water_pokemon) 

#### ROUTE 6 ################ ID:27
r6 = Area.find_or_create_by(name: "Route 6", 
                             north_area_id: 28, 
                             south_area_id: 26, 
                             east_area_id: nil, 
                             west_area_id: nil, 
                             pokemon_list: r6_pokemon_list,
                             water_list: r6_water_pokemon)

#### Saffron City ################ ID:28
sc = Area.find_or_create_by(name: "Saffron City", 
                             north_area_id: 16, 
                             south_area_id: 27, 
                             east_area_id: 23, 
                             west_area_id: 29, 
                             pokemon_list: nil,
                             water_list: nil)

#### Route 7 ################ ID:29
r7 = Area.find_or_create_by(name: "Route 7", 
                             north_area_id: nil, 
                             south_area_id: nil, 
                             east_area_id: 28, 
                             west_area_id: 30, 
                             pokemon_list: r7_pokemon_list,
                             water_list: nil)

#### Celadon City ################ ID:30
cc = Area.find_or_create_by(name: "Celadon City", 
                             north_area_id: nil, 
                             south_area_id: 31, 
                             east_area_id: 29, 
                             west_area_id: nil, 
                             pokemon_list: nil,
                             water_list: cc_water_pokemon)

#### Route 16 ################ ID:31
r16 = Area.find_or_create_by(name: "Route 16", 
                             north_area_id: 30, 
                             south_area_id: 32, 
                             east_area_id: nil, 
                             west_area_id: nil, 
                             pokemon_list: r16_pokemon_list,
                             water_list: nil)

#### Route 17 ################ ID:32
r17 = Area.find_or_create_by(name: "Route 17", 
                             north_area_id: 31, 
                             south_area_id: 33, 
                             east_area_id: nil, 
                             west_area_id: nil, 
                             pokemon_list: r17_pokemon_list,
                             water_list: r17_water_pokemon)

#### Route 18 ################ ID:33
r18 = Area.find_or_create_by(name: "Route 18", 
                             north_area_id: 32, 
                             south_area_id: nil, 
                             east_area_id: 34, 
                             west_area_id: nil, 
                             pokemon_list: r18_pokemon_list, 
                             water_list: r18_water_pokemon)

#### Fuchsia City ################ ID:34
fc = Area.find_or_create_by(name: "Fuchsia City", 
                             north_area_id: nil, 
                             south_area_id: 38, 
                             east_area_id: 35, 
                             west_area_id: 33, 
                             pokemon_list: nil,
                             water_list: fc_water_pokemon)
