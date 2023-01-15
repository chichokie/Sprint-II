db.restaurant.find().limit(100)
db.restaurant.find({},{"name":1,"borough":1,"cuisine:":1}).limit(2)
db.restaurant.find({},{"restaurant_id":1,"name":1,"borough":1,"cuisine":1,"_id":0}).limit(2)
db.restaurant.find({},{"restaurant_id":1,"name":1,"borough":1,"address.zipcode":1,"_id":0}).limit(2)
db.restaurant.find({"borough":"Bronx"}).limit(20)
db.restaurant.find({"borough":"Bronx"}).limit(5)
db.restaurant.find({"borough":"Bronx"}).skip(5).limit(2)
db.restaurant.find({"grades.score":{$gt:90}}).limit(2)
X db.restaurant.find({"grades.score":{$gt:80,$lt:100}}).limit(2) -- db.restaurant.find({ $and: [{ "grades.score": { $gte: 80 }},{"grades.score":{$lte:100}}]})-- db.restaurant.find({"grades.score":{$gte:80,$lte:100}})
db.restaurant.find({"address.coord.0":{$gt:-95754168}}).limit(10)
db.restaurant.find({$and:[{"cuisine":{$ne:'American '}},{"grades.score":{$gt:70}},{"address.coord.1":{$gt:-65754168}}]}).limit(3)

db.restaurant.find({$and:[{"cuisine":{$ne:'American '}},{"grades.grade":'A'},{"borugh":{$ne:'Brooklyn'}},{"address.coord.0":{$gt:-65754168}}]}).sort({cuisine:-1}).limit(3)
db.restaurant.find({name:{$regex:'Wil'}},{"name":1,"borough":1,"cuisine":1}).limit(2)
db.restaurant.find({name:{$regex:'.*ces$'}},{"name":1,"borough":1,"cuisine":1}).limit(2)
db.restaurant.find({name:{$regex:'.*Reg'}},{"name":1,"borough":1,"cuisine":1}).limit(2)
db.restaurant.find({$and:[{$or:[{"cuisine":{$in:['American ','Chinese']}}},{"borugh":{$in:'Bronx'}}]}).limit(3)














