class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :locations, dependent: :destroy
  has_many :listens
  has_many :favorites
  has_many :comments

  # mount_uploader :attachment, AttachmentUploader

  # has_attached_file :artwork
  # validates_attachment_content_type :artwork, :content_type => ["image/html", "image/jpg", "image/png", "image/jpeg"]

  accepts_nested_attributes_for :locations

  validates :name, :attachment, presence: true
  # def song_location
  #   self.locations.first.lat.to_s + ", " + self.locations.first.long.to_s
  # end

  # def address
  #   self.
  # end

  # def address_location
  #   self.address_components.address[2]["long_name"]
  # end

  # def address_city
  #   self.address_components.address[3]["short_name"]
  # end


  def neighborhood
    self.locations.first.neighborhood
  end

  def city
    self.locations.first.city
  end

  def expire
    self.locations.first.expiration ||= nil
  end

  def in_range?(user_lat, user_long)
    song_lat = self.locations.first.lat.to_f
    song_long = self.locations.first.long.to_f
    distance_between = self.measure(user_lat.to_f, user_long.to_f, song_lat, song_long)
     song_radius = self.locations.first.radius
     puts "radius: #{song_radius} distance: #{distance_between }"
    distance_between < song_radius
  end

   def measure(lat1, lon1, lat2, lon2)
      radius = 6378.137 # Radius of earth in KM
      dLat = (lat2 - lat1) * Math::PI / 180;
      dLon = (lon2 - lon1) * Math::PI / 180;
      a = Math::sin(dLat/2) * Math::sin(dLat/2) +
      Math::cos(lat1 * Math::PI / 180) * Math::cos(lat2 * Math::PI / 180) *
      Math::sin(dLon/2) * Math::sin(dLon/2);
      c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a));
      d = radius * c;
      return d * 1000; # meters

  end
end
