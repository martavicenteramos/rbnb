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
    @review = Review.create(review_params)
    @review.booking = @booking
    authorize @review

    if @review.save!
      redirect_to root_path
    else
      render :new
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
