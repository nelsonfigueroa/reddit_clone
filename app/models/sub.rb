class Sub < ApplicationRecord

  # sub owner
  belongs_to :user
  has_many :posts

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

end
