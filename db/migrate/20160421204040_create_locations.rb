class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :long
      t.float :lat
      t.float :radius
      t.integer :song_id
      t.datetime :expiration, :default => Time.now + 30.days

      t.timestamps null: false

    end
  end
end
