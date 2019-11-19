class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  def show?
    record == user # Anyone can see user profile
  end

  def create?
    true  # Anyone can create a  user profile
  end

  def update?
    record == user  # Only dog creator can update it
  end

  def destroy?
    record == user  # Only dog creator can update it
  end
end
