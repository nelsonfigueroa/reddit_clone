class UpvotesController < ApplicationController

  def create
    @upvote = Upvote.new(upvote_params)

    # if user previously downvoted post, remove downvote
    @downvote = Downvote.where(user_id: @upvote.user_id, post_id: @upvote.post_id).first
    unless @downvote.nil?
      @downvote.destroy
    end

    @upvote.save

    # instead of redirecting, do AJAX in the future.
    redirect_back(fallback_location: :back)
  end

  def destroy
    @upvote = Upvote.find_by_id(params[:id])
    @upvote.destroy

    # instead of redirecting, do AJAX in the future.
    redirect_back(fallback_location: :back)
  end

  private

  # Used when creating new shops
  def upvote_params
    params.require(:upvote).permit(:user_id, :post_id)
  end

end
