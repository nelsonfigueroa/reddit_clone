class UpvotesController < ApplicationController

  def create
    @upvote = Upvote.new(upvote_params)
    @upvote.save

    # instead of redirecting, do AJAX in the future.
    redirect_back(fallback_location: :back)
  end

  private

  # Used when creating new shops
  def upvote_params
    params.require(:upvote).permit(:user_id, :post_id)
  end

end
