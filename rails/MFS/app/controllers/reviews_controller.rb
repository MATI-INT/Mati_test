class ReviewsController < ApplicationController
  def destroy
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
    @review = Review.new(params[:review])
    if @review.save
      flash[:success] = 'Review was created!'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
  end

  def index
    @reviews = Review.order('created_at DESC').paginate(
        page: params[:page],
        per_page: 10
    )
  end
end