class Event < ApplicationRecord
  before_create :set_uuid

  has_many :users
  has_many :comments, dependent: :destroy
  has_many :event_join_statuses, dependent: :destroy

  validates :event_name,:event_at, presence: true
  validates :event_name, length: {maximum: 20}
  validates :user_name, presence: true
  validates :user_name, length: {maximum: 10}

  validate :event_at_cannot_be_in_the_past


  def event_at_cannot_be_in_the_past
    if event_at.present? && event_at.to_datetime < Date.today.to_time.to_datetime
      errors.add(:event_at, "は現在より過去の日時の指定はできません。")
    end
  end


  private
  def set_uuid
    while self.id.blank? || Event.find_by(id: self.id).present? do
      self.id = SecureRandom.uuid
    end
  end

end
