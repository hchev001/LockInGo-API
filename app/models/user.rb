require 'bcrypt'

class User < ApplicationRecord
  has_secure_password
  has_many :tasks

  # the user has one wallet per token type they support
  has_many :wallets


  validates :email, presence: true, uniqueness: true

  def as_json(options={})
    super(options.merge(except: [:password_digest]))
  end
end
