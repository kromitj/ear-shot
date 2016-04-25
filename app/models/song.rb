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

  def song_location
    self.locations.first.lat.to_s + ", " + self.locations.first.long.to_s
  end

  def address
    Geocoder.search(self.song_location).first
  end

  def address_location
    self.address_components.address[2]["long_name"]
  end

  def address_city
    self.address_components.address[3]["short_name"]
  end

  def expire
    self.locations.first.expiration ||= nil
  end
end
