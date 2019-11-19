class PicturesController < ApplicationController
  before_action :set_dog

  def create
    @picture = Picture.new(picture_params)
    authorize @picture
    @picture.dog = @dog
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def picture_params
    params.require(:picture).permit(:photo)
  end
end
