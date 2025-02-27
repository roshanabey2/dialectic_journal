class Note < ApplicationRecord
  belongs_to :user
  has_many :bullet_points
  has_many :messages
end
