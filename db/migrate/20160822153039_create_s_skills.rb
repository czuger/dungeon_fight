class CreateSSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :s_skills do |t|
      t.string :name, null: false
      t.string :desc
      t.integer :difficulty, null: false, default: 1

      t.string :first_attribute, null: false
      t.string :second_attribute, null: false

      t.timestamps
    end
  end
end
