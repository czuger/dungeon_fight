class CreateIItems < ActiveRecord::Migration[5.0]
  def change
    create_table :i_items do |t|
      t.string :name
      t.string :desc
      t.integer :difficulty, default: 0
      t.integer :attack_dice
      t.references :c_class_id, foreign_key: true
      t.integer :min_level, default: 0

      t.timestamps
    end
  end
end
