class Event < ApplicationRecord
  has_many :user
  has_many :comment

  validates :event_name,:event_at, presence: true
  validates :event_name, length: {maximum: 20}
end
