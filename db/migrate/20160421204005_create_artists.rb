class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :user_id
      t.string :hometown
      t.text :bio
      t.string :profile_picture

      t.timestamps null: false
    end
  end
end
