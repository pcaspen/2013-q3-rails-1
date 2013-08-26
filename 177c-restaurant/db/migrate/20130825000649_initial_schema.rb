class InitialSchema < ActiveRecord::Migration
def up
    create_table :tables do |t|
      t.integer :total_chairs
      t.boolean :occupied
    end

    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :table_id
      t.integer :chair_number
      t.integer :entree_id
    end

		create_table :entrees do |t|
      t.decimal :price
      t.string :name
    end

    create_table :orders do |t|
      t.integer :table_id
      t.datetime :created_at
      t.datetime :updated_at
      t.decimal :total_price
      t.boolean :paid_yet
    end
  end

  def down
    drop_table :tables
    drop_table :order_lines
    drop_table :entrees
    drop_table :orders 
  end
end