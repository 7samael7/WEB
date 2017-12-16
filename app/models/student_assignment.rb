class StudentAssignment < ApplicationRecord
  has_one :course
  has_one :student
end
