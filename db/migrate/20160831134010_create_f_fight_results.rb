class CreateFFightResults < ActiveRecord::Migration[5.0]
  def change
    create_table :f_fight_results do |t|
      t.references :f_fight, foreign_key: true

      t.references :attacker, polymorphic: true
      t.references :defender, polymorphic: true

      t.integer :round
      t.integer :roll
      t.integer :roll_with_bonus
      t.integer :to_hit
      t.boolean :success
      t.integer :skills_points_earned

      t.timestamps
    end
  end
end
