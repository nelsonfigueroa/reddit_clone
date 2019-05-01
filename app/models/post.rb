class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub
  has_many :upvotes
  has_many :downvotes

  validates :title, :content, presence: true

  # scope for top posts where net_votes descending

  def net_votes
    self.upvotes.size - self.downvotes.size
  end
end
