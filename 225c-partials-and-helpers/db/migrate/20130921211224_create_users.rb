class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.date    :birth_date
      t.boolean :is_admin

      t.timestamps
    end
  end
end
