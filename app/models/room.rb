class Room < ApplicationRecord
  belongs_to :building
  has_many :lessons

  validates :title, presence: true, length: { minimum: 3 }
end
