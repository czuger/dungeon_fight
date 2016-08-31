class CreateJoinTableFFightMMonster < ActiveRecord::Migration[5.0]
  def change
    create_join_table :f_fights, :m_monsters do |t|
      t.index [:f_fight_id, :m_monster_id]
      # t.index [:m_monster_id, :f_fight_id]
    end
  end
end
