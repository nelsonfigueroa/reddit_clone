class PostsController < ApplicationController
  
  # def index

  # end

  def show
    @post = Post.find_by_id(params[:id])
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
