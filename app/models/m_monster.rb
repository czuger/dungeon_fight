class MMonster < ApplicationRecord

  include GameLogic::Combat

  belongs_to :attack_item, class_name: 'IItem'

  def attack_challenge
    { comp_bonus: attack_level, total_bonus:  attack_level - attack_item.difficulty,
      item_difficulty: attack_item.difficulty }
  end

end
