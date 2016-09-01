module GameLogicModel
  module Fighter

    def attack( defender, fight, round_nb )
      dice_result = rand( 1..10 ) + rand( 1..10 )
      to_hit = 10
      hit = dice_result + attack_challenge[ :total_bonus ] >= to_hit
      skill_points = add_skill_points( hit )
      damage = remove_hit_points( hit, defender )
      fight.f_fight_results.create!( attacker: self, defender: defender, roll: dice_result,
        roll_with_bonus: dice_result + attack_challenge[ :total_bonus ], to_hit: to_hit, success: hit,
        skills_points_earned: skill_points, round: round_nb, hit_points_loss: damage, remaining_hit_points: defender.hit_points )
    end

    def add_skill_points( hit )
      if hit && self.class == DDungeoneer
        skill = d_dungeoneer_skills.find_by_s_skill_id( attack_item.s_skill_id )
        skill.increment!( :skills_points, 5 )
        return 5
      end
      nil
    end

    def remove_hit_points( hit, defender )
      if hit
        damage_dice = attack_item.attack_dice
        damage = rand( 1 .. damage_dice )
        defender.decrement!( :hit_points, damage )
        return damage
      end
      nil
    end

  end
end