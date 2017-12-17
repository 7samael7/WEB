class Building < ApplicationRecord
  has_many :rooms

  validates :title, presence: true, length: { minimum: 3 }
end
