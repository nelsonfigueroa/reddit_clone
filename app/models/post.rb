class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub
  has_many :upvotes
  has_many :downvotes

  validates :title, :content, presence: true

  default_scope { order(created_at: :desc) }

  def net_votes
    self.upvotes.size - self.downvotes.size
  end
end
