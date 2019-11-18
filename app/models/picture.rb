class Picture < ApplicationRecord
  belongs_to :dog

  validates :photo, presence: true
end
