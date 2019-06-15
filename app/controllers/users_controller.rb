# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.includes(posts: [:sub]).find_by(id: params[:id])
  end
end
