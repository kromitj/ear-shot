class Location < ActiveRecord::Base
  belongs_to :song

  validates :radius, presence: true
end
