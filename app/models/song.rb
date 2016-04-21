class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :locations
  has_many :listens
  has_many :favorites
  has_many :comments
end
