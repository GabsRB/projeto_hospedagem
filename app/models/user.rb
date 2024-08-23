class User < ApplicationRecord
      has_secure_password

      validates :email, presence: true, uniqueness: true
      validates :password, presence: true, length: { minimum: 6 }, on: :create
      validates :password_confirmation, presence: true, on: :create
      validates :user_type, presence: true, on: :update
    
      enum user_type: { voluntario: 0, anfitriao: 1 }
  end
  