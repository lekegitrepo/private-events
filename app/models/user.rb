class User < ApplicationRecord
  # has_many :events_created, foreign_key: :creator_id, class_name: 'Event'
  # has_many :events_created, foreign_key: :creator_id, class_name: 'Event'
  has_many :events, foreign_key: 'creator_id'

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.create_token
    SecureRandom.urlsafe_base64
  end
end
