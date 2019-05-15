class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  has_many :subs
  has_many :posts
  has_many :comments
  has_many :votes

  # has many posts through votes?
  # scope for created posts, which is different from posts by the user that were simply down/up voted

  validates :email, :username, presence: true, uniqueness: true

  def has_not_voted?(post)
    unless self.votes.where(:post_id => post.id, :upvote => true, :downvote => false).exists? || self.votes.where(:post_id => post.id, :upvote => false, :downvote => true).exists?
      return true
    else
      return false
    end
  end

  def upvoted_post?(post)
    if self.votes.where(:post_id => post.id, :upvote => true, :downvote => false).exists?
      return true
    else
      return false
    end
  end

  def downvoted_post?(post)
    if self.votes.where(:post_id => post.id, :upvote => false, :downvote => true).exists?
      return true
    else
      return false
    end 
  end

end
