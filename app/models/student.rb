class Student < ApplicationRecord
  has_many :student_assignments

  validates_format_of :email, multiline: true,:with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  enum study_type: [:full_time, :part_time]
end
