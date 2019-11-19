class DogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a dog
  end

  def create?
    true  # Anyone can create a dog
  end

  def update?
    record.user = user  # Only dog creator can update it
  end

  def destroy?
    record.user = user  # Only dog creator can update it
  end
end
