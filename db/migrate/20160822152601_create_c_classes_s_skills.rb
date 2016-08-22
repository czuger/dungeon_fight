class CreateCClassesSSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :c_classes_s_skills, id: false do |t|
      t.references :c_class, null: false, foreign_key: true, index: true
      t.references :s_skill, null: false, foreign_key: true, index: true
    end
  end
end
