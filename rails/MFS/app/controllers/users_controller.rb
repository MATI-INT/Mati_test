class UsersController < ApplicationController
  def toggle_role
    authorize! :toggle_role, UsersController

    @user = User.find_by_id(params[:id])
    if @user
      if @user.role == 'admin'
        @user.role = 'user'
      else
        @user.role = 'admin'
      end
      @user.save
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    authorize! :destroy, UsersController
    user = User.find_by_id(params[:id])
    if user
      if user.destroy
        flash[:success] = 'User destroyed!'
      else
        flash[:error] = 'Error destroying user!'
      end
    else
      flash[:error] = 'User not found!'
    end

    redirect_to users_url
  end

  def index
    authorize! :index, UsersController
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @latest_reviews = @user.reviews.limit(10)
    # /users/1
  end
end
