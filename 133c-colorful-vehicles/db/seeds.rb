# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Color.create(
	name: "purple",  
	html_color_code: "#6666FF"
	)

Color.create(
	name: "yellow",  
	html_color_code: "#FFFF66"
	)

Color.create(
	name: "green",   
	html_color_code: "#66FF66"
	)

Color.create(
	name: "fuschia", 
	html_color_code: "#CC00FF"
	)

Vehicle.create(
	name: "car",      
	image_filename: "car.png"
	)

Vehicle.create(
	name: "bicycle",  
	image_filename: "bike.png"
	)

Vehicle.create(name: "bus",      image_filename: "bus.png")
Vehicle.create(name: "airplane", image_filename: "plane.png")
