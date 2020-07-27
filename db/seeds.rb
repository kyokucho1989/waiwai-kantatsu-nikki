# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'test@example.com', password: 'password')

Plant.create(user_id:1, plant_name: "flower", img: "flower_img") 
Plant.create(user_id:1, plant_name: "sun_flower", img: "sun_flower_img") 
Plant.create(user_id:2, plant_name: "dia", img: "dia_img") 
Plant.create(user_id:3, plant_name: "rose", img: "rose_img") 
