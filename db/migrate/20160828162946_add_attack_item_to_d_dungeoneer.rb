class AddAttackItemToDDungeoneer < ActiveRecord::Migration[5.0]
  def change
    add_reference :d_dungeoneers, :attack_item
    add_foreign_key :d_dungeoneers, :i_items, column: :attack_item_id
  end
end
