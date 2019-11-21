class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    true # Only person who booked the dog or the owener
  end

  def create?
    booking = record.booking

    Booking.find(booking.id).review.nil? && booking.status == 'accepted' && booking.start_date < Time.now
  end

  def update?
    false

  end

  def destroy?
    false
  end
end
