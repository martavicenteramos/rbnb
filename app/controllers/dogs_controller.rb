class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :set_booking, only: [:show]

  def index
    @filter = params["filter"]
    @dogs = policy_scope(Dog).order(created_at: :desc) if @filter.values.join == ""
    @dogs = policy_scope(Dog)
    @dogs = @dogs.where('breed ILIKE ?', "%#{@filter['breed']}%") if @filter["breed"].present?
    @dogs = @dogs.where('size = ?', @filter["size"]) if @filter["size"].present?
    @dogs = @dogs.where('age = ?', @filter["age"]) if @filter["age"].present?
    @dogs = @dogs.where('gender = ?', @filter["gender"]) if @filter["gender"].present?
    @dogs = @dogs.near(@filter["city"], 10) if @filter["city"].present?

    @dogs = @dogs.search(params[:search])

    @length = @dogs.length
    @dogs = policy_scope(Dog).order(created_at: :desc) if @dogs.length.zero?
    all_location
  end

  def show
    authorize @dog
    single_location(@dog)
  end

  def new
    @dog = Dog.new
    authorize @dog
    authorize @booking
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

  def set_booking
    @booking = Booking.new
  end

  def all_location
    @dog_loc = Dog.geocoded

    @markers = @dog_loc.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude
      }
    end
  end

  def single_location(dog)
    @dog = Dog.geocoded.where(id: dog.id).first

    @markers =
      {
        lat: @dog.latitude,
        lng: @dog.longitude
      }
  end
end
