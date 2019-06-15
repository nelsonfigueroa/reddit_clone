class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id

    respond_to do |format|
      if @vote.save
        format.html { redirect_back(fallback_location: :back) }
        format.json { render json: @vote, status: :created, location: @vote }
        format.js
      else
        format.html { redirect_back(fallback_location: :back, notice: 'Something went wrong') }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @vote = Vote.find_by_id(params[:id])

    respond_to do |format|
      if @vote.update_attributes(vote_params)
        format.html { redirect_back(fallback_location: :back) }
        format.json { render json: @vote, status: :created, location: @vote }
        format.js
      else
        format.html { redirect_back(fallback_location: :back, notice: 'Something went wrong') }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @vote = Vote.find_by_id(params[:id])

    respond_to do |format|
      if @vote.destroy
        format.html { redirect_back(fallback_location: :back) }
        format.json { render json: @vote, status: :created, location: @vote }
        format.js
      else
        format.html { redirect_back(fallback_location: :back, notice: 'Something went wrong') }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private

  # Used when creating new votes
  def vote_params
    params.require(:vote).permit(:user_id, :post_id, :upvote, :downvote)
  end
end
