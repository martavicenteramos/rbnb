class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
  end

  def create
  end

  def new
  end

  def delete
  end
end
