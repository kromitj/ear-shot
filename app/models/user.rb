class User < ActiveRecord::Base
  has_many :listens
  has_many :artists
  has_many :comments
  has_many :favorites
end
