class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub

  validates :title, :content, presence: true
end
