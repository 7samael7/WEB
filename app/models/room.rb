class Room < ApplicationRecord
  has_one :building
  has_many :lessons
end
