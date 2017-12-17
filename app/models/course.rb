class Course < ApplicationRecord
  extend Enumerize

  has_many :lessons
  has_and_belongs_to_many :teachers, join_table: :teacher_assignments
  has_and_belongs_to_many :students, join_table: :student_assignments
  has_many :teacher_assignments
  has_many :student_assignments

  validates :title, presence: true, length: { minimum: 3 }

  enumerize :language,   in: [:czech, :english], default: :czech
  enumerize :study_type, in: [:full_time, :part_time], default: :full_time
end
