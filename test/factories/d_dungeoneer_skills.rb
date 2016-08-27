FactoryGirl.define do
  factory :d_dungeoneer_skill do
    active true
    active_since Time.now - 20
    level 1
    skills_points 250
  end
end
