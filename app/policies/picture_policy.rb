class PicturePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  def show?
    true # Only user can see this picture
  end

  def create?
    record == user # Anyone can create a picture
  end

  def update?
    record == user  # Only dog creator can update it
  end

  def destroy?
    record == user  # Only dog creator can update it
  end
end
