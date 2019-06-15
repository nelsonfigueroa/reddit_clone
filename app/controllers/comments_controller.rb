# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_back(fallback_location: :back, notice: 'Comment successfully created!') }
        format.json { render json: @comment, status: :created, location: @comment }
        format.js
      else
        format.html { redirect_back(fallback_location: :back, notice: 'Something went wrong') }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end
end
