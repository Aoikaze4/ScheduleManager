class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :comment, presence: true
  validates :length, { in: 1..128 }
end
