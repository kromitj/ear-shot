class Song < ActiveRecord::Base
  # has_attached_file :file
  # validates_attachment_content_type :attachment, :content_type => ["image/html"]
  belongs_to :artist
  has_many :locations
  has_many :listens
  has_many :favorites
  has_many :comments
  mount_uploader :attachment, AttachmentUploader
  accepts_nested_attributes_for :locations

  validates :name, presence: true
  # validates :attachment, uniqueness: true

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
