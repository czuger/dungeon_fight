class AddAttackItemToDDungeoneer < ActiveRecord::Migration[5.0]
  def change
    add_reference :d_dungeoneers, :attack_item
    add_foreign_key :m_monsters, :i_items, column: :attack_item_id
  end
end
