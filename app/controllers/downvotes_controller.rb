class DownvotesController < ApplicationController

  def create
    @downvote = Downvote.new(downvote_params)

    # if user previously upvoted post, remove upvote
    @upvote = Upvote.where(user_id: @downvote.user_id, post_id: @downvote.post_id).first
    unless @upvote.nil?
      @upvote.destroy
    end

    @downvote.save

    # instead of redirecting, do AJAX in the future.
    redirect_back(fallback_location: :back)
  end

  def destroy
    @downvote = Downvote.find_by_id(params[:id])
    @downvote.destroy

    # instead of redirecting, do AJAX in the future.
    redirect_back(fallback_location: :back)
  end

  private

  # Used when creating new shops
  def downvote_params
    params.require(:downvote).permit(:user_id, :post_id)
  end

end
