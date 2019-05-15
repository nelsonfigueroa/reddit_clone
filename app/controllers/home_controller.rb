class HomeController < ApplicationController

  # landing page
  def index
    # get top posts
    @posts = Post.all.includes(:sub, :user).sort_by { |post| post.net_votes }.reverse
  end

  # not RESTful
  def technologies
    
  end

end
