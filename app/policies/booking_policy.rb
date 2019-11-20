class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    true # Anyone can create a booking
  end

  def create?
    true # Anyone can create a booking
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
