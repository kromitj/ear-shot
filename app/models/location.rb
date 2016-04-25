class Location < ActiveRecord::Base
  MAX_RADIUS=5000 #meters
  belongs_to :song


  validates :long, :lat, :radius, presence: true
  validates :radius, numericality: {less_than_or_equal_to: MAX_RADIUS}


end
