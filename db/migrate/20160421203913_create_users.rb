class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :profile_picture
      # :default => 'https://www.drupal.org/files/profile_default.png'

      t.timestamps null: false
    end
  end
end
