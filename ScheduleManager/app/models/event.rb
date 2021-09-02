class Event < ApplicationRecord
  has_many :user
  has_many :comment

  validates :event_name,:event_at, presence: true
  validates :event_name, length: {maximum: 20}
  validate :event_at_cannot_be_in_the_past

  def event_at_cannot_be_in_the_past
    binding.pry
    if event_at.present? && event_at.to_datetime < Date.today.to_time.to_datetime
      errors.add(:event_at, "現在より過去の日時は指定できません。")
    end
  end
end
