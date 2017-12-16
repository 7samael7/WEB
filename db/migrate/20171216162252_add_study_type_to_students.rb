class AddStudyTypeToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :study_type, :int, default: 0
  end
end
