class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_images
  has_many :events
  has_many :comments, dependent: :destroy
  has_many :event_join_statuses, dependent: :destroy

  attachment :image
end
