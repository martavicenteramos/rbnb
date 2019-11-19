class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = policy_scope(Dog).order(created_at: :desc)
  end

  def show
    authorize @dog
  end

  def create
    authorize @dog
  end

  def new
    authorize @dog
  end

  def delete
    authorize @dog
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end
end