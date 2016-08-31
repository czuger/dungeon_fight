FactoryGirl.define do
  factory :f_fight_result do
    fight nil
    attacker nil
    attacker_type "MyString"
    defender nil
    defender_type "MyString"
    roll 1
    roll_with_bonus 1
    to_hit 1
    success false
    skills_points_earned 1
  end
end
