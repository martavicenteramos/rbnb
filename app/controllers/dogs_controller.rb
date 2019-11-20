class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_dog, only: [:show, :edit, :update, :destroy]


  def index
    @dogs = policy_scope(Dog).order(created_at: :desc)
  end

  def show
    authorize @dog
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    @picture = Picture.new
    @dog.user = current_user
    authorize @dog
    if @dog.save
      render :edit
    else
      render :new
    end
  end

  def destroy
    authorize @dog
    if @dog.destroy
     redirect_to user_path(current_user)
    end
  end

  def edit
    authorize @dog
    @picture = Picture.new
  end

  def update
    authorize @dog

    if @dog.update(dog_params)
      @dog.save
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
