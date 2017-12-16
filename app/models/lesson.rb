class Lesson < ApplicationRecord
  has_one :room
  has_one :teacher
  has_one :course
end
