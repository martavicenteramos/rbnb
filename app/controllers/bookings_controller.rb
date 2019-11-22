class BookingsController < ApplicationController
  before_action :set_dog, only: [:new, :create]
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @my_bookings = policy_scope(Booking).order(start_date: :asc).where(user_id: current_user.id)
    @my_old_bookings = @my_bookings.where('status IN (?) OR end_date < ? ', ['rejected'], Time.new)

    @my_bookings = @my_bookings.where('start_date > ?', Time.new)
    @my_bookings = @my_bookings.where('status IN (?)', ['accepted', 'pending'])
    # dogs = current_user.dogs

    # dog_ids = dogs.map do |dog|
    #    dog.id
    # end
    dog_ids = current_user.dog_ids
    @my_dogs_bookings = policy_scope(Booking).where(dog_id: dog_ids)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.dog = @dog
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render 'dogs/show'
    end
  end

  def edit
    authorize @booking
    @dog = @booking.dog
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Booking was successfully updated.'
    else
      redirect_to bookings_path, notice: 'Booking was not updated!.'
    end
  end

  def destroy
    authorize @booking
    @booking.destroy

    redirect_to bookings_path, notice: 'Booking was successfully deleted.'
  end

  def availability
    @booking = Booking.where(["dog_id =?", @dog.id])
    date_ranges = bookings.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      record.errors.add(attribute, "not available") if range.include? value
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
