class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
