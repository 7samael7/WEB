class Student < ApplicationRecord
  has_many :student_assignments

  has_one enum StudyType: [:FULL_TIME, :PART_TIME]
end
