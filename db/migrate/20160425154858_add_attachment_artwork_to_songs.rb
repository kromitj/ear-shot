class AddAttachmentArtworkToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.attachment :artwork
    end
  end

  def self.down
    remove_attachment :songs, :artwork
  end
end
