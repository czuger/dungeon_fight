class DDungeoneer < ApplicationRecord
  belongs_to :c_class

  has_many :d_dungeoneer_skills, dependent: :destroy
  has_many :s_skills, through: :d_dungeoneer_skills, source: :s_skill

end
