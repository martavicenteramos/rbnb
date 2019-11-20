class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dog_show]
  def home
    @dogs = Dog.all
  end

  def dog_show
    @dog = Dog.find(params[:id])
  end
end
