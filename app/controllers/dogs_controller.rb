class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

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

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
