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
    @forum = Forum.find_by(id: params[:forum_id])
    @post.user_id = current_user.id
    @post.forum_id = @forum.id

    if @post.save
      redirect_to(forum_path(@forum))
    else
      flash[:notice] = 'Invalid input!'
      render('new')
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :forum_id)
  end
end
