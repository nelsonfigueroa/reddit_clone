# frozen_string_literal: true

class Forum < ApplicationRecord
  # forum owner
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  default_scope { order(name: :asc) }
end
