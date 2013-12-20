class VotesController < ApplicationController
  def create
    if current_user
      review = Review.find_by_id(params[:review_id])
      vote_type = params[:vote_type].to_s

      if review && %w(up down).include?(vote_type) &&
          !current_user.voted_for?(review)
        vote = current_user.votes.build
        vote.review_id = review.id
        vote.vote_type = vote_type
        if vote.save
          flash[:success] = 'Your vote was saved!'
        else
          flash[:error] = 'Error while voting!'
        end
        redirect_to review_path(review)
      else
        flash[:error] = 'Error while voting!'
        redirect_to root_url
      end
    else
      flash[:error] = 'You have to authorize!'
      redirect_to root_url
    end
  end
end