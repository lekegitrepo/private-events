class User < ApplicationRecord
  has_many :events_created, class_name: 'Event', foreign_key: 'creator_id'

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.create_token
    SecureRandom.urlsafe_base64
  end
end
