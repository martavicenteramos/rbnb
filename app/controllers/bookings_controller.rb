class BookingsController < ApplicationController
  before_action :set_dog

  def index
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
      redirect_to root_path
    else
      render :new
    end
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
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end
end
