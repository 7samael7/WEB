class Student < ApplicationRecord
  extend Enumerize

  has_many :student_assignments
  has_and_belongs_to_many :courses, join_table: :student_assignments

  validates_format_of :email, multiline: true,:with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  enumerize :study_type, in: [:full_time, :part_time], default: :full_time

  def to_s
    "#{first_name} #{last_name}"
  end
end
