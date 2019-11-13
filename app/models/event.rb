class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances

  validates_presence_of :name, :description, :location

  scope :upcoming, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }
end
