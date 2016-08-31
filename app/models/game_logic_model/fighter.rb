module GameLogicModel
  module Fighter

    def attack( defender, fight, round_nb )
      dice_result = rand( 1..10 ) + rand( 1..10 )
      to_hit = 10
      result = dice_result + attack_challenge[ :total_bonus ] >= to_hit
      skill_points = add_skill_points( result )
      fight.f_fight_results.create!( attacker: self, defender: defender, roll: dice_result,
        roll_with_bonus: dice_result + attack_challenge[ :total_bonus ], to_hit: to_hit, success: result,
        skills_points_earned: skill_points, round: round_nb)
    end

    def add_skill_points( result )
      if result && self.class == DDungeoneer
        skill = d_dungeoneer_skills.find_by_s_skill_id( attack_item.s_skill_id )
        skill.increment!( :skills_points, 5 )
        return 5
      end
      nil
    end

  end
end