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

  def edit
    authorize @dog
    @picture = Picture.new
  end

  def update
    authorize @dog
    if @dog.update(dog_params)
      render :show
    else
      render :show
    end
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :description, :size, :age, :breed, :gender, :location, :filter)
  end
end
