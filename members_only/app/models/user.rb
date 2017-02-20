
class User < ApplicationRecord
require 'bcrypt'

  has_secure_password
  validates :name, presence: true, length:{in:(3..20)}
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: true
end
