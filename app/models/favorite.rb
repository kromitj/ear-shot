class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  has_one :artist, through: :song

  validates :song_id, uniqueness: {scope: :user_id}
end
