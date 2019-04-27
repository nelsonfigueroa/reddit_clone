class HomeController < ApplicationController

  # landing page
  def index
    # get top posts
    @posts = Post.all
  end

end
