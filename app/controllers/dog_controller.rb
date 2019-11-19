class DogController < ApplicationController
  def index
    @dogs = Dog.where(dog_params[:filter])
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permite(:name, :description, :size, :age, :breed, :gender, :location, :filter)
  end
end
