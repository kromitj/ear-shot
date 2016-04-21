class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
