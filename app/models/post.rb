class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub
  has_many :comments
  has_many :upvotes
  has_many :downvotes

  validates :title, :content, presence: true

  default_scope { order(created_at: :desc) }

  def net_votes
    self.upvotes.size - self.downvotes.size
  end

  def created_at_formatted
    self.created_at.localtime.strftime("%l:%M%p %m/%d/%Y")
  end
end
