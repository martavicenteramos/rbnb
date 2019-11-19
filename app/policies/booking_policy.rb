class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true # Anyone can create a dog
  end

  def create?
    true # Anyone can create a dog
  end
end
