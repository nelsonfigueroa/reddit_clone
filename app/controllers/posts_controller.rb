class PostsController < ApplicationController
  
  def index
    # might not even need index
  end

  def show

  end

  def new

  end

  def create

  end

  def sub_params
    params.require(:post).permit(:title, :content, :user_id, :sub_id)
  end
end
