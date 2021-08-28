class Event < ApplicationRecord
  has_many :user
  has_many :comment
end
