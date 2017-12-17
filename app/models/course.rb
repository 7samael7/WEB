class Course < ApplicationRecord
  has_many :lessons
  has_and_belongs_to_many :students, join_table: :student_assignments
  has_many :teacher_assignments
  has_many :student_assignments

  validates :title, presence: true, length: { minimum: 3 }

  enum language: [:czech, :english]
  enum study_type: [:full_time, :part_time]
end
