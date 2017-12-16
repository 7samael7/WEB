class Student < ApplicationRecord
  has_many :student_assignments

  enum study_type: [:full_time, :part_time]
end
