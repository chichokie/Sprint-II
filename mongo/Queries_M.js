db.restaurant.find().limit(100)
db.restaurant.find({},{"name":1,"borough":1,"cuisine:":1}).limit(2)
db.restaurant.find({},{"restaurant_id":1,"name":1,"borough":1,"cuisine":1,"_id":0}).limit(2)
db.restaurant.find({},{"restaurant_id":1,"name":1,"borough":1,"address.zipcode":1,"_id":0}).limit(2)
db.restaurant.find({"borough":"Bronx"}).limit(20)
db.restaurant.find({"borough":"Bronx"}).limit(5)
db.restaurant.find({"borough":"Bronx"}).skip(5).limit(2)

