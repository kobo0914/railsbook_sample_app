class User < ApplicationRecord
  has_one :author
  has_many :reviews
  has_many :books, through: :reviews
  validates :agreement, acceptance: true
  validates :email, confirmation: true
  has_secure_password
end
