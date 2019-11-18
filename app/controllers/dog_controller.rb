class DogController < ApplicationController
  def index
    @dogs = Dog.all
  end
end
