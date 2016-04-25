class Song < ActiveRecord::Base
  # has_attached_file :file
  # validates_attachment_content_type :attachment, :content_type => ["image/html"]
  belongs_to :artist
  has_many :locations, dependent: :destroy
  has_many :listens
  has_many :favorites
  has_many :comments
  mount_uploader :attachment, AttachmentUploader
  accepts_nested_attributes_for :locations

  validates :name, presence: true
  # validates :attachment, uniqueness: true

  def song_location
    self.locations.first.lat.to_s + ", " + self.locations.first.long.to_s
  end

  def address
    Geocoder.search(self.song_location).first.address_components
  end

  def address_location
    self.address[2]["long_name"]
  end

  def address_city
    self.address[3]["short_name"]
  end

  def expire
    self.locations.first.expiration ||= nil
  end
end
