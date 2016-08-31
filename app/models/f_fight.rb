class FFight < ApplicationRecord
  include GameLogicModel::Combat

  has_and_belongs_to_many :d_dungeoneers
  has_and_belongs_to_many :m_monsters

  has_many :f_fight_results, dependent: :destroy

end
