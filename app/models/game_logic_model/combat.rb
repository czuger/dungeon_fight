module GameLogic
  module Combat

    def round( monsters, dungeoneers )

      attackers = Hash[ ( monsters + dungeoneers ).map{ |e| [ e.class.name+e.id.to_s, e ] } ]
      attackers_ids = attackers.keys.shuffle

      round_result = []

      until attackers_ids.empty?
        attacker_id = attackers_ids.shift
        attacker = attackers[ attacker_id ]
        if attacker.class == MMonster
          defender = dungeoneers.sample
        else
          defender = monsters.sample
        end
        round_result << attacker.attack( defender )
      end
    end

    def attack( defender )
      dice_result = rand( 1..10 ) + rand( 1..10 )
      result = dice_result <= attack_challenge[ :total_bonus ]
      "#{name} -> #{defender.name} - roll: #{dice_result} - attack_succeed: #{result}" + add_skill_points( result )
    end

    def add_skill_points( result )
      if result && self.class == DDungeoneer
        skill = d_dungeoneer_skills.find_by_s_skill_id( attack_item.s_skill_id )
        skill.increase( 5 )
        return ' - skills points earned : 5'
      end
      ''
    end

  end
end