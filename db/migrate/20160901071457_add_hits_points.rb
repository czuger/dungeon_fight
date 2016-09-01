class AddHitsPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :d_dungeoneers, :hit_points, :integer, null: false, default: 8
    add_column :m_monsters, :hit_points, :integer, null: false, default: 8
    add_column :f_fight_results, :hit_points_loss, :integer
    add_column :f_fight_results, :remaining_hit_points, :integer
  end
end
