class SubsController < ApplicationController
  
  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.includes(posts: [:user]).find_by_id(params[:id])
  end

  def new
    if user_signed_in?
      @sub = Sub.new
    else
      redirect_to(root_path)
    end
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id # keep here for security, hidden fields can easily be modified.

    if @sub.save
      redirect_to(subs_path)
    else
      flash[:notice] = "Invalid input!"
      render('new')
    end
  end

  private

  # Used when creating new shops
  def sub_params
    params.require(:sub).permit(:name, :description, :user_id)
  end

end
