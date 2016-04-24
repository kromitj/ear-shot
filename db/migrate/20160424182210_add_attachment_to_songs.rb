class AddAttachmentToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :attachment, :string
  end
end
