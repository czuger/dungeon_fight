class RenameCoCombatToFFight < ActiveRecord::Migration[5.0]
  def change
    rename_table :co_combats, :f_fights
  end
end
