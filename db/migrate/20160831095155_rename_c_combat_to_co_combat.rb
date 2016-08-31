class RenameCCombatToCoCombat < ActiveRecord::Migration[5.0]
  def change
    rename_table :c_combats, :co_combats
  end
end
