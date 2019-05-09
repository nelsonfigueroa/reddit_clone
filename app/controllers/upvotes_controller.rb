class UpvotesController < ApplicationController

  # def create
  #   @upvote = Upvote.new(upvote_params)
  #   @upvote.user_id = current_user.id

  #   # if user previously downvoted post, remove downvote
  #   @downvote = Downvote.where(user_id: @upvote.user_id, post_id: @upvote.post_id).first
  #   unless @downvote.nil?
  #     @downvote.destroy
  #   end

  #   @upvote.save

  #   # instead of redirecting, do AJAX in the future.
  #   redirect_back(fallback_location: :back)
  # end

  def create
    @upvote = Upvote.new(upvote_params)
    @upvote.user_id = current_user.id

    # if user previously downvoted post, remove downvote
    @downvote = Downvote.where(user_id: @upvote.user_id, post_id: @upvote.post_id).first
    unless @downvote.nil?
      @downvote.destroy
    end
   
    respond_to do |format|
      if @upvote.save
        format.html { redirect_back(fallback_location: :back, notice: 'Upvoted!') }
        format.json { render json: @upvote, status: :created, location: @upvote }
        format.js { redirect_back(fallback_location: :back, notice: 'Upvoted!') }
      else
        format.html { redirect_back(fallback_location: :back, notice: 'Something went wrong') }
        format.json { render json: @upvote.errors, status: :unprocessable_entity }
        format.js { redirect_back(fallback_location: :back, notice: 'Something went wrong') }
      end
    end
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
