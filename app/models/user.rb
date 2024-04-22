class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: 'user_id', dependent: :destroy
  has_many :attendee_events, foreign_key: "attendee_id"
  has_many :attended_events, through: :attendee_events, source: :event
end
