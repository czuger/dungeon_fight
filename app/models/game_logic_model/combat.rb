module GameLogicModel
  module Combat

    def resolve_combat( monsters, dungeoneers )

      ( monsters + dungeoneers ).each do |fighter|
        fighter.update_attribute( :hit_points, 8 )
      end

      self.m_monster_ids = monsters.pluck(:id)
      self.d_dungeoneer_ids = dungeoneers.pluck(:id)

      i = 1
      until monsters.empty? || dungeoneers.empty?
        round( monsters, dungeoneers, i )
        remove_deads( monsters, dungeoneers )
        i += 1
      end

      if monsters.empty?
        pp dungeoneers
        update_attribute( :winners, dungeoneers.map(&:name).join( ', ' ) )
      else
        update_attribute( :winners, monsters.map(&:name).join( ', ' ) )
      end

    end

    private

    def remove_deads( monsters, dungeoneers )
      monsters.reject!{ |e| e.hit_points <= 0 }
      dungeoneers.reject!{ |e| e.hit_points <= 0 }
    end

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

  end
end