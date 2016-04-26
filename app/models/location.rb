class Location < ActiveRecord::Base
  MAX_RADIUS=5000 #meters
  belongs_to :song


  validates :long, :lat, :radius, presence: true
  validates :radius, numericality: {less_than_or_equal_to: MAX_RADIUS}

  reverse_geocoded_by :lat, :long do |obj,results|
    if geo = results.first
      obj.city = geo.city
      obj.neighborhood = geo.neighborhood
    end
  end
  after_validation :reverse_geocode
end
