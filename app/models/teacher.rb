class Teacher < ApplicationRecord
  has_many :lessons
  has_many :teacher_assignments
  has_and_belongs_to_many :courses, join_table: :teacher_assignments

  validates_format_of :email, multiline: true,:with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i


  def to_s
    "#{first_name} #{last_name}"
  end
end
