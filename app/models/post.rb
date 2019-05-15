class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub
  has_many :comments
  has_many :votes

  validates :title, :content, presence: true

  default_scope { order(created_at: :desc) }

  def net_votes
    self.votes.where(upvote: true, downvote: false).size - self.votes.where(upvote: false, downvote: true).size
  end

  def created_at_formatted
    self.created_at.localtime.strftime("%l:%M%p %m/%d/%Y")
  end
end
