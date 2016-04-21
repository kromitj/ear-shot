class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :long
      t.string :lat
      t.float :radius
      t.integer :song_id
      t.datetime :expiration, default: nil

      t.timestamps null: false

    end
  end
end
