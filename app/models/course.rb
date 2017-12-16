class Course < ApplicationRecord
  has_many :lessons
  has_many :teacher_assignments
  has_many :student_assignments

  enum language: [:CZECH, :ENGLISH]
  enum study_type: [:FULL_TIME, :PART_TIME]
end
