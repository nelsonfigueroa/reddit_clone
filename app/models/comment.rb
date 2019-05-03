class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true

  def created_at_formatted
    self.created_at.localtime.strftime("%l:%M%p %m/%d/%Y")
  end
end
