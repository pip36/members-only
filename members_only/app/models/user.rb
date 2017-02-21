
class User < ApplicationRecord
require 'bcrypt'
attr_accessor :remember_token
  has_secure_password
  validates :name, presence: true, length:{in:(3..20)}
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: true

  def encrypt(string)
    BCrypt::Password.create(string, cost: 6)
  end

  def User.create_token
    SecureRandom.urlsafe_base64
  end

  def remember
      self.remember_token = User.create_token
      update_attribute(:remember_digest, encrypt(remember_token))
  end

  def forget
    update_attribute(:remember_token, nil)
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest) == remember_token
  end
end
