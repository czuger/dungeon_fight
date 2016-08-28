class CreateIItems < ActiveRecord::Migration[5.0]
  def change
    create_table :i_items do |t|
      t.string :name
      t.string :desc
      t.integer :difficulty, default: 0
      t.integer :attack_dice
      t.integer :min_level, default: 0

      t.references :c_class, foreign_key: true

      t.timestamps
    end
  end
end
