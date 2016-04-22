class CreateListens < ActiveRecord::Migration
  def change
    create_table :listens do |t|
      t.integer :user_id
      t.integer :song_id
      t.float :long
      t.float :lat

      t.timestamps null: false
    end
  end
end
