class User < ApplicationRecord
  has_many :events_created, foreign_key: :creator_id, class_name: 'Event'
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances
  # has_many :events, foreign_key: 'creator_id'

  validates_presence_of :name

  def attend(event)
    attendances.create(attended_event_id: event.id)
  end

  def cancel(event)
    attendances.find_by(attended_event_id: event.id).destroy
  end

  def attending?(event)
    event.attendees.include?(self)
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.create_token
    SecureRandom.urlsafe_base64
  end
end
