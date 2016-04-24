class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      # t.string :attachement
      t.integer :artist_id
      t.string :artwork

      t.timestamps null: false
    end
  end
end
