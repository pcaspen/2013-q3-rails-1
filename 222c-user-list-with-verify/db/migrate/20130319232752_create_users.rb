class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :was_email_verified
      t.string :email_verification_token
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
