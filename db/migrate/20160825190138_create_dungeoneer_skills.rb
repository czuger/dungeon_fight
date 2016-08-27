class CreateDungeoneerSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :d_dungeoneer_skills do |t|
      t.references :d_dungeoneer, null: false, foreign_key: true, index: true
      t.references :s_skill, null: false, foreign_key: true, index: true

      t.integer :skills_points, null: false, default: 0
      t.integer :level, null: false, default: 1

      t.timestamps
    end
  end
end
