class AddLanguageToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :language, :int, default: 0
    add_column :courses, :study_type, :int, default: 0
  end
end
