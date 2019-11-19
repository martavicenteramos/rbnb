class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    # return the path based on resource
    request.referrer
  end


end
