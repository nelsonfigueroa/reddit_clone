class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub
  has_many :comments
  has_many :votes

  validates :title, :content, presence: true

  default_scope { order(created_at: :desc) }

  # votes == self.votes
  def net_votes
    votes.where(upvote: true, downvote: false).size - votes.where(upvote: false, downvote: true).size
  end

  def created_at_formatted
    created_at.localtime.strftime("%l:%M%p %m/%d/%Y")
  end
end
