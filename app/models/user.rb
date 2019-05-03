class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  has_many :subs
  has_many :posts
  has_many :comments
  has_many :upvotes
  has_many :downvotes

  # has many posts through downvotes?
  # scope for created posts, which is different from posts by the user that were simply down/up voted

  validates :email, :username, presence: true, uniqueness: true

  def upvoted_post?(post)
    if self.upvotes.where(:post_id => post.id).exists?
      return true
    else
      return false
    end
  end

  def downvoted_post?(post)
    if self.downvotes.where(:post_id => post.id).exists?
      return true
    else
      return false
    end 
  end

end
