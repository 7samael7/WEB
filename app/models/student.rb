class Student < ApplicationRecord
  has_many :student_assignments

  enum StudyType: [:FULL_TIME, :PART_TIME]
end
