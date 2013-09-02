# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
photo1 = Photo.create! title: "Flatirons at dawn"
photo2 = Photo.create! title: "Flatirons at sunset"
photo3 = Photo.create! title: "Sunset from my window"
photo4 = Photo.create! title: "Mysterious blur"

tag1 = Tag.create! keyword: "Flatirons"
tag2 = Tag.create! keyword: "dawn"
tag3 = Tag.create! keyword: "sunset"
tag4 = Tag.create! keyword: "Pluto"

photo1.tags << tag1
photo1.tags << tag2
photo2.tags << tag1
photo2.tags << tag3
photo3.tags << tag3
photo4.tags << nil