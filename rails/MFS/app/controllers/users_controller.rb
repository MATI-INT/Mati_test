class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @latest_reviews = @user.reviews.limit(10)
    # /users/1
  end
end
