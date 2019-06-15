# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @post = Post.includes(comments: [:user]).find_by(id: params[:id])

    if user_signed_in?
      # for comment form
      @comment = Comment.new
    end
  end

  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to(root_path)
    end
  end

  def create
    @post = Post.new(post_params)
    @sub = Sub.find_by(id: params[:sub_id])
    @post.user_id = current_user.id
    @post.sub_id = @sub.id

    if @post.save
      redirect_to(sub_path(@sub))
    else
      flash[:notice] = 'Invalid input!'
      render('new')
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :sub_id)
  end
end
