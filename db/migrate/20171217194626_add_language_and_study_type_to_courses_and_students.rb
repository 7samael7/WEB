class AddLanguageAndStudyTypeToCoursesAndStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :language, :string
    add_column :courses, :study_type, :string
    change_column :students, :study_type, :string
  end
end
