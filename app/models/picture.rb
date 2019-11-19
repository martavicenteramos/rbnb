class Picture < ApplicationRecord
  belongs_to :dog

  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
