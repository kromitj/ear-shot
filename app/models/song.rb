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
end

