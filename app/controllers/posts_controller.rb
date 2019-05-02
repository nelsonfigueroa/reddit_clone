class PostsController < ApplicationController
  
  # def index

  # end

  def show
    @post = Post.find_by_id(params[:id])

    if user_signed_in?
      # for form, in the event that user has already upvoted
      @upvote = current_user.upvotes.where(:post_id => @post.id).first
    
      # for form, in the event that user has already downvoted
      @downvote = current_user.downvotes.where(:post_id => @post.id).first
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
    @sub = Sub.find_by_id(params[:sub_id])
    @post.user_id = current_user.id
    @post.sub_id = @sub.id

    if @post.save
      redirect_to(sub_path(@sub))
    else
      flash[:notice] = "Invalid input!"
      render('new')
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :sub_id)
  end
end
