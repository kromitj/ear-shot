class CreateListens < ActiveRecord::Migration
  def change
    create_table :listens do |t|
      t.integer :user_id
      t.integer :song_id
      t.string :long
      t.string :lat

      t.timestamps null: false
    end
  end
end
