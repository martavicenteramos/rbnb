class Review < ApplicationRecord
  belongs_to :booking
  before_create :has_review?
  belongs_to :user, inverse_of: :reviews

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }, presence: true

  def review?
    return if Review.exists?(user: user, dog_id: dog_id)
  end

  # def performed(user_id)
  #   Review.joins(:booking).where('bookings.user_id = ?', user_id)
  # end
end
