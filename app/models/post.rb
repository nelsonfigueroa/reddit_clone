# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub
  has_many :comments
  has_many :votes

  validates :title, :content, presence: true

  default_scope { order(created_at: :desc) }

  # votes == self.votes
  def net_votes
    upvotes - downvotes
  end

  def percentage_of_upvotes
    # neutral
    if downvotes == 0 && upvotes == 0
      50
    # only upvotes
    elsif downvotes == 0 && upvotes > 0
      100
    # only downvotes
    elsif downvotes > 0 && upvotes == 0
      0
    else
      # change to .size
      ((upvotes.to_f / votes.size.to_f) * 100).to_i
    end
  end

  def created_at_formatted
    created_at.localtime.strftime('%l:%M%p %m/%d/%Y')
  end

  private

  def upvotes
    votes.where(upvote: true, downvote: false).size
  end

  def downvotes
    votes.where(upvote: false, downvote: true).size
  end
end
