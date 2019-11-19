class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit]

  def show
    authorize @user
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
    authorize @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :photo)
  end
end

