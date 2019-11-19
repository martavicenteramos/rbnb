class Dog < ApplicationRecord
  belongs_to :user
  has_many :pictures
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :size, presence: true, inclusion: { in: %w[Small Medium Large] }
  validates :age, presence: true
  validates :breed, presence: true
  validates :gender, presence: true, inclusion: { in: %w[Male Female] }
  validates :location, presence: true
end
