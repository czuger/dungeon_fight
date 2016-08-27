class DDungeoneer < ApplicationRecord
  belongs_to :c_class

  has_many :d_dungeoneer_skills, dependent: :destroy
  has_many :s_skills, through: :d_dungeoneer_skills, source: :s_skill

  has_one :s_current_learning_d_dungeoneer_skill, -> { where( active: true ) }, class_name: DDungeoneerSkill
  has_one :s_current_learning_skill, through: :s_current_learning_d_dungeoneer_skill, source: :s_skill
end
