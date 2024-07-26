class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, presence: true, length: { minimum: 6 }
  before_save { self.email = email.downcase }
end
