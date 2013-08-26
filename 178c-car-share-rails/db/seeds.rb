# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Car.create(color: "red",   model: "VW Golf")
Car.create(color: "black", model: "VW Jetta")
Car.create(color: "white", model: "Toyota Celica")

Member.create(username: "jen", password: "123")
Member.create(username: "ted", password: "456")

car = Car.where(model: "VW Jetta").first
car.reserving_member_id = Member.where(username: "jen").first.id
car.save!
