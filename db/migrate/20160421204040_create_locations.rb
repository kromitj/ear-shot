class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :neighborhood
      t.float :long
      t.float :lat
      t.float :radius
      t.integer :song_id
      t.datetime :expiration, :default => Time.now + 30.days

      t.timestamps null: false

    end
  end
end
