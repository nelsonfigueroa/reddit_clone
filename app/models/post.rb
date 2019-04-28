class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub
  has_many :upvotes

  validates :title, :content, presence: true
end
