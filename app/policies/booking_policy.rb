class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    record.user == user
  end

  def new?
    true # Anyone can create a booking
  end

  def create?
    true # Anyone can create a booking
  end

  def update?
    record.dog.user_id == user.id
  end

  def destroy?
    false
  end
end
