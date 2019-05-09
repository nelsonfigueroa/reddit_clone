class DownvotesController < ApplicationController

  # def create
  #   @downvote = Downvote.new(downvote_params)
  #   @downvote.user_id = current_user.id

  #   # if user previously upvoted post, remove upvote
  #   @upvote = Upvote.where(user_id: @downvote.user_id, post_id: @downvote.post_id).first
  #   unless @upvote.nil?
  #     @upvote.destroy
  #   end

  #   @downvote.save

  #   # instead of redirecting, do AJAX in the future.
  #   redirect_back(fallback_location: :back)
  # end

  def create
    @downvote = Downvote.new(downvote_params)
    @downvote.user_id = current_user.id

    # if user previously upvoted post, remove upvote
    @upvote = Upvote.where(user_id: @downvote.user_id, post_id: @downvote.post_id).first
    unless @upvote.nil?
      @upvote.destroy
    end
   
    respond_to do |format|
      if @downvote.save
        format.html { redirect_back(fallback_location: :back) }
        format.json { render json: @downvote, status: :created, location: @downvote }
        format.js { redirect_back(fallback_location: :back) }
      else
        format.html { redirect_back(fallback_location: :back, notice: 'Something went wrong') }
        format.json { render json: @downvote.errors, status: :unprocessable_entity }
        format.js { redirect_back(fallback_location: :back, notice: 'Something went wrong') }
      end
    end
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
