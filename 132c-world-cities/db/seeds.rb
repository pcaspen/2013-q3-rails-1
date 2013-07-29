# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

WorldCity.create(
  name: "London",
  country: "United Kingdom",
  country_flag_filename: "gb.png",
  time_zone_offset: 0,
  population_in_millions: 8.3
)

WorldCity.create(
  name: "New York City",
  country: "United States of America",
  country_flag_filename: "us.png",
  time_zone_offset: -5,
  population_in_millions: 8.3
)

WorldCity.create(
  name: "Shanghai",
  country: "China",
  country_flag_filename: "cn.png",
  time_zone_offset: 8,
  population_in_millions: 23
)
