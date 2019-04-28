class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  has_many :subs
  has_many :posts
  has_many :upvotes

  validates :email, :username, presence: true, uniqueness: true

end
