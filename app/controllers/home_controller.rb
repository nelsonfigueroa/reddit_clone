# frozen_string_literal: true

class HomeController < ApplicationController
  # landing page
  def index
    # get top posts
    # previous line...
    # @posts = Post.all.includes(:sub, :user).sort_by { |post| post.net_votes }.reverse
    @posts = Post.all.includes(:sub, :user).sort_by(&:net_votes).reverse
  end

  # technologies used page
  def technologies; end
end
