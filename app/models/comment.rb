# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true

  def created_at_formatted
    created_at.localtime.strftime('%l:%M%p %m/%d/%Y')
  end
end
