module GameLogicController
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

  end
end