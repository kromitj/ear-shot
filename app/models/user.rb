class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_password

  has_many :listens, dependent: :destroy
  has_many :artists, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :f_name, :l_name, :username, :email, presence: true
  validates :username, :email, uniqueness: true
  # validates :password, length: {minimum: 8}

  def user_is_artist?
    self.artists.count > 0
  end

end
