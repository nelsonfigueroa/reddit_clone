class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, :post_id, presence: true

  # validate that if downvote is true, upvote is false and etc.
  
  # user_id and post_id should be unique together
  validates :user_id, uniqueness: { scope: :post_id }
end
