
require 'open-uri'

url = "https://places.sit.ls.hereapi.com/places/v1/discover/search?app_id=022FvQdLL9b0AcJH6KAc&app_code=2X3HFhGoJA_FgHSXHX7DvQ&at=52.5044,13.3909&q=restaurant&pretty"

json =  open(url).read

place = "https://places.sit.ls.hereapi.com/places/v1/places/276u33d8-0547239d44884ce88281f634fae1937c;context=Zmxvdy1pZD00ZDhiMjAzNi0zOGI0LTUyNjAtYjVkYS0zNjVhZDZmYzI1ZjBfMTU4MTM5MzA1MDk3MF84ODdfOTYxMiZyYW5rPTQ?app_id=022FvQdLL9b0AcJH6KAc&app_code=2X3HFhGoJA_FgHSXHX7DvQ"

json =  open(place).read
pp json