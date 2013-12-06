class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def is_authenticated
    unless current_user
      flash[:error] = 'You are not authorized to do that!'
      redirect_to root_url
    end
  end
end
