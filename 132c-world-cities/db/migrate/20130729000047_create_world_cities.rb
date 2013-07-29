class CreateWorldCities < ActiveRecord::Migration
  def up
  	create_table :world_cities do |t|
  	  t.string :name
  	  t.string :country
  	  t.integer :time_zone_offset
  	  t.float :population_in_millions
  	  t.text :country_flag_filename	
    end
  end
 
  def down
  	drop_table :world_cities
  end
end