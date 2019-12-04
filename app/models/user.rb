# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  has_many :forums
  has_many :posts
  has_many :comments
  has_many :votes

  # has many posts through votes?
  # scope for created posts, which is different from posts by the user that were simply down/up voted

  validates :email, :username, presence: true, uniqueness: true

  # votes == self.votes
  def has_not_voted?(post)
    if votes.where(post_id: post.id, upvote: true, downvote: false).exists? || votes.where(post_id: post.id, upvote: false, downvote: true).exists?
      false
    else
      true
    end
  end

  def upvoted_post?(post)
    if votes.where(post_id: post.id, upvote: true, downvote: false).exists?
      true
    else
      false
    end
  end

  def downvoted_post?(post)
    if votes.where(post_id: post.id, upvote: false, downvote: true).exists?
      true
    else
      false
    end
  end

  # returns posts upvoted by user, id == self.id
  def upvoted_posts
    Post.includes(:forum, :user)
        .joins(:votes)
        .where('votes.user_id' => id, 'votes.upvote' => 1, 'votes.downvote' => 0)
  end

  # returns posts downvoted by user, id == self.id
  def downvoted_posts
    Post.includes(:forum, :user)
        .joins(:votes)
        .where('votes.user_id' => id, 'votes.upvote' => 0, 'votes.downvote' => 1)
  end
end
