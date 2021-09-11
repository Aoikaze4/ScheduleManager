class Event < ApplicationRecord
  before_create :set_uuid

  has_many :users
  has_many :comments
  has_many :event_join_statuses

  validates :event_name,:event_at, presence: true
  validates :event_name, length: {maximum: 20}
  validate :event_at_cannot_be_in_the_past

  def event_at_cannot_be_in_the_past
    if event_at.present? && event_at.to_datetime < Date.today.to_time.to_datetime
      errors.add(:event_at, "現在より過去の日時は指定できません。")
    end
  end


  private
  def set_uuid
    while self.id.blank? || Event.find_by(id: self.id).present? do
      self.id = SecureRandom.uuid
    end
  end

end
