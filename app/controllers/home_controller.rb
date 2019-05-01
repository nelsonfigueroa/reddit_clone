class HomeController < ApplicationController

  # landing page
  def index
    # get top posts
    @posts = Post.all
  end

  # not RESTful
  def technologies
    
  end

end
