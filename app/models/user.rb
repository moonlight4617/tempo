class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password
  mount_uploader :image, ImageUploader
  has_many :calendars

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def save_remember_digest
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget_remember_digest
    update_attribute(:remember_digest, nil)
  end

end
