class Dog < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :size, presence: true, inclusion: { in: %w[Small Medium Large] }
  validates :age, presence: true
  validates :breed, presence: true
  validates :gender, presence: true, inclusion: { in: %w[Male Female] }
  validates :location, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  include AlgoliaSearch

  algoliasearch do
    attributes :name, :description
  end

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def average_rating
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end

    sum.to_f / reviews.length
  end
end
