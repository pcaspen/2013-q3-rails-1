# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


person1 = Person.create! name: "Jill"
person2 = Person.create! name: "Jack"
person3 = Person.create! name: "Bob"

CellPhone.create! serial_number: "12345", person: person1
CellPhone.create! serial_number: "23456", person: person2
CellPhone.create! serial_number: "34567", person: nil