class CreateMMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :m_monsters do |t|
      t.string :name, null: false
      t.string :desc
      t.integer :attack_level
      t.references :attack_item

      t.timestamps
    end
    add_foreign_key :m_monsters, :i_items, column: :attack_item_id
  end
end
