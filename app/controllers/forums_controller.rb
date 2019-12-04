# frozen_string_literal: true

class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def show
    @forum = Forum.includes(posts: [:user]).find_by(id: params[:id])
  end

  def new
    if user_signed_in?
      @forum = Forum.new
    else
      redirect_to(root_path)
    end
  end

  def create
    @forum = Forum.new(forum_params)
    @forum.user_id = current_user.id # keep here for security, hidden fields can easily be modified.

    if @forum.save
      redirect_to(forums_path)
    else
      flash[:notice] = 'Invalid input!'
      render('new')
    end
  end

  private

  def forum_params
    params.require(:forum).permit(:name, :description, :user_id)
  end
end
