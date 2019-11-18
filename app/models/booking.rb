class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :dog
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[accepted rejected pending] }
end
