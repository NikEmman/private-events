class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "user_id"
    has_many :attendee_events, dependent: :destroy
    has_many :attendees, through: :attendee_events

    scope :past, ->{where("time <= ?", Time.now)}
    scope :future, ->{where("time >= ?", Time.now)}
end
