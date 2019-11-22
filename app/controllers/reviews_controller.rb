class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    if @booking.status == "accepted"
      @review = Review.create(review_params)
      @review.booking = @booking
      authorize @review

      if @review.save!
        redirect_to 'bookings_path', notice: 'Review was successfully created.'
      else
        render :new
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
