class MMonster < ApplicationRecord
  belongs_to :attack_item, class_name: 'IItem'
end
