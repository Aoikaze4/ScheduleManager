class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  validates :comment, presence: true
  validates :comment, length: { in: 1..128 }

  validates :user_name, presence: true
  validates :user_name, length: { maximum: 20 }

  attachment :image
end
