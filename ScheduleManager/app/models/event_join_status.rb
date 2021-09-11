class EventJoinStatus < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  enum status: { "参加する": 0, "保留": 1, "参加しない": 2}, _prefix: true;

  validates :status, presence: true
end
