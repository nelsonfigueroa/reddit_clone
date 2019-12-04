# frozen_string_literal: true

class HomeController < ApplicationController
  # landing page
  def index
    # get top posts
    @posts = Post.all.includes(:forum, :user).sort_by(&:net_votes).reverse
  end

  # technologies used page
  def technologies; end
end
