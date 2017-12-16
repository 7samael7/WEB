class Course < ApplicationRecord
  has_many :lessons
  has_many :teacher_assignments
  has_many :student_assignments

  enum Language: [:CZECH, :ENGLISH]
  enum StudyType: [:FULL_TIME, :PART_TIME]
end
