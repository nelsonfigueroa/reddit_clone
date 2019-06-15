class UsersController < ApplicationController
  def show
    @user = User.includes(posts: [:sub]).find_by_id(params[:id])
  end
end
