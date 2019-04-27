class SubsController < ApplicationController
  
  def index
    @subs = Sub.all
  end

  def show

  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id # move this to view or keep here for security?
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
    params.require(:sub).permit(:name, :user_id)
  end

end
