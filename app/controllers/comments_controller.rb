class CommentsController < ApplicationController
  
  # redirect_back(fallback_location: :back)

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_back(fallback_location: :back)
    else
      flash[:notice] = "Invalid input!"
      redirect_back(fallback_location: :back)
    end
  end

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end

end
