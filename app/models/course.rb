class Course < ApplicationRecord
  has_many :lessons
  has_many :teacher_assignments
  has_many :student_assignments

  has_one enum Language: [:CZECH, :ENGLISH]
  has_one enum StudyType: [:FULL_TIME, :PART_TIME]
end
