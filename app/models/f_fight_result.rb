class FFightResult < ApplicationRecord
  belongs_to :f_fight
  belongs_to :attacker, polymorphic: true
  belongs_to :defender, polymorphic: true
end
