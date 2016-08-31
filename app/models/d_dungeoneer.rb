class DDungeoneer < ApplicationRecord

  include GameLogicModel::Fighter

  belongs_to :c_class
  belongs_to :attack_item, class_name: 'IItem', optional: true

  has_many :d_dungeoneer_skills, dependent: :destroy
  has_many :s_skills, through: :d_dungeoneer_skills, source: :s_skill

  def attack_challenge
    raise "attack_item nil" unless attack_item
    attack_comp = d_dungeoneer_skills.where( s_skill_id: attack_item.s_skill_id ).first
    raise "attack_comp nil" unless attack_comp

    main_attr = send( attack_item.s_skill.first_attribute )
    second_attr = send( attack_item.s_skill.second_attribute )
    attr_bonus = ((main_attr - 10) + (second_attr - 10))/2

    total_bonus = attr_bonus + attack_comp.level - attack_item.difficulty
    { attr_bonus: attr_bonus, comp_bonus: attack_comp.level, total_bonus: total_bonus,
      item_difficulty: attack_item.difficulty }
  end

end
