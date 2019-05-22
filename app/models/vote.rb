class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, :post_id, presence: true
  # user_id and post_id should be unique together
  validates :user_id, uniqueness: { scope: :post_id }

  # upvotes / downvotes
  scope :upvotes, -> { where(upvote: true, downvote: false) }
  scope :downvotes, -> { where(upvote: false, downvote: true) }
end
