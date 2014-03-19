class ReviewsController < ApplicationController
  before_filter :is_authenticated, except: [:show, :index]

  def destroy
    authorize! :destroy, ReviewsController
    @review = Review.find_by_id(params[:id])
    if @review
      if @review.destroy
        flash[:success] = 'Review was deleted!'
      else
        flash[:error] = 'Cannot delete review!'
      end
    else
      flash[:error] = 'No such review!'
    end

    redirect_to root_url
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(params[:review])
    if @review.save
      flash[:success] = 'Review was created!'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
    @vote = Vote.new
  end

  def index
    @reviews = Review.all_cached.paginate(
        page: params[:page],
        per_page: 15
    )
  end
end