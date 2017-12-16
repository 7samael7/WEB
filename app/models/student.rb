class Student < ApplicationRecord
  has_many :student_assignments

  enum study_type: [:FULL_TIME, :PART_TIME]
end
