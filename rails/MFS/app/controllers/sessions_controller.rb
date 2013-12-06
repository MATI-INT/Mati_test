class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])

    session[:mfs_user] = user.id

    flash[:success] =
        "Welcome to MFS #{current_user.user_name}!"
    redirect_to root_url
  end

  def destroy
    if current_user
      session.delete(:mfs_user)
      flash[:success] = 'See you!'
    else
      flash[:error] = 'You are not authorized!'
    end
    redirect_to root_url
  end
end