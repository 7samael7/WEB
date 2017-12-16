class TeacherAssignment < ApplicationRecord
  has_one :teacher
  has_one :course
end
