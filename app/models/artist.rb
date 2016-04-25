class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :songs, dependent: :destroy

  validates :name, :hometown, :bio, presence: true
  validates :name, uniqueness: true
  validates :bio, length: {maximum: 500}
end

