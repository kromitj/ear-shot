class User < ActiveRecord::Base
  has_secure_password

  has_many :listens
  has_many :artists
  has_many :comments
  has_many :favorites
end
