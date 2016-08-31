class CreateJoinTableDDungeoneerFFight < ActiveRecord::Migration[5.0]
  def change
    create_join_table :d_dungeoneers, :f_fights do |t|
      # t.index [:d_dungeoneer_id, :f_fight_id]
      t.index [:f_fight_id, :d_dungeoneer_id]
    end
  end
end
