class AddLanguageToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :language, :int, default: 0
    add_column :lessons, :study_type, :int, default: 0
  end
end
