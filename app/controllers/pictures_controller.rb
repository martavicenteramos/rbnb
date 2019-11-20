class PicturesController < ApplicationController
  before_action :set_dog

  def create
    @picture = Picture.new(picture_params)
    @picture.dog_id = params[:dog_id].to_i
    authorize @picture
    if @picture.save
      redirect_to edit_dog_path(@dog)
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    authorize @dog
    if @picture.destroy
      redirect_to edit_dog_path(@dog)
    end
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def picture_params
    params.require(:picture).permit(:photo)
  end
end
