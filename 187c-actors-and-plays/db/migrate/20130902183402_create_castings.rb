class CreateCastings < ActiveRecord::Migration
  def change
    create_table :castings do |t|
      t.integer :actor_id
      t.integer :character_id
      t.integer :play_id

      t.timestamps
    end
  end
end
