class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :character_name

      t.timestamps
    end
  end
end
