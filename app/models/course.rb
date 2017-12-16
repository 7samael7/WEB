class Course < ApplicationRecord
  has_many :lessons
  has_many :teacher_assignments
  has_many :student_assignments

  enum language: [:czech, :english]
  enum study_type: [:full_time, :part_time]
end
