class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :locations, dependent: :destroy
  has_many :listens
  has_many :favorites
  has_many :comments

  # mount_uploader :attachment, AttachmentUploader

  has_attached_file :artwork
  validates_attachment_content_type :artwork, :content_type => ["image/html", "image/jpg", "image/png", "image/jpeg"]

  accepts_nested_attributes_for :locations

  validates :name, :attachment, presence: true

  def location
    [self.locations.first.lat, self.locations.first.long]
  end

  def address_location
    Geocoder.search([self.location[0].to_s, self.location[1].to_s]).first.address_components[2]["long_name"]
  end

  def address_street
    Geocoder.search([self.location[0].to_s, self.location[1].to_s]).first.address_components[1]["short_name"]
  end

    def address_state
    Geocoder.search([self.location[0].to_s, self.location[1].to_s]).first.address_components[3]["short_name"]
  end

  def expire
    self.locations.first.expiration ||= nil
  end
end
