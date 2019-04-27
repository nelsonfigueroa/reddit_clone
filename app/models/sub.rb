class Sub < ApplicationRecord

  # sub owner
  belongs_to :user

  validates :name, presence: true, uniqueness: true

end
