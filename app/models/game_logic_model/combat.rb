module GameLogicModel
  module Combat

    def round( monsters, dungeoneers, round_nb )

      attackers = Hash[ ( monsters + dungeoneers ).map{ |e| [ e.class.name+e.id.to_s, e ] } ]
      attackers_ids = attackers.keys.shuffle

      until attackers_ids.empty?
        attacker_id = attackers_ids.shift
        attacker = attackers[ attacker_id ]
        if attacker.class == MMonster
          defender = dungeoneers.sample
        else
          defender = monsters.sample
        end
        attacker.attack( defender, self, round_nb )
      end
    end

    def resolve_combat( monsters, dungeoneers )

      self.m_monster_ids = monsters.pluck(:id)
      self.d_dungeoneer_ids = dungeoneers.pluck(:id)

      1.upto(5).each do |i|
        round( monsters, dungeoneers, i )
      end

    end
  end
end