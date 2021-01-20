class Owner < ApplicationRecord
  has_many :shops, dependent: :destroy
  has_secure_password

  def Owner.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Owner.new_token
    SecureRandom.urlsafe_base64
  end

  def save_remember_digest
    self.remember_token = Owner.new_token
    update_attribute(:remember_digest, Owner.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget_remember_digest
    update_attribute(:remember_digest, nil)
  end
end
