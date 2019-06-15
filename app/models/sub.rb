# frozen_string_literal: true

class Sub < ApplicationRecord
  # sub owner
  belongs_to :user
  has_many :posts

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  default_scope { order(name: :asc) }
end
