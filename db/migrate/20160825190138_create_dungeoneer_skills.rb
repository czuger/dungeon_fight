class CreateDungeoneerSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :dungeoneer_skills, id: false do |t|
      t.reference :dungeoneer, null: false
      t.reference :skill, null: false

      t.timestamps
    end
  end
end
