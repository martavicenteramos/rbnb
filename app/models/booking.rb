class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :dog
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[accepted rejected pending] }
  validate :end_date_after_start_date

  def booked_date_range
    { from: :start_date, to: :end_date }
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
