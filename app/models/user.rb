class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_secure_password

  has_many :listens
  has_many :artists
  has_many :comments
  has_many :favorites
end
