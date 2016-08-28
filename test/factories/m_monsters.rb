FactoryGirl.define do
  factory :m_monster do
    name "MyString"
    desc "MyString"
    attack_level 1
    attack_item_id { create( :i_item ).id }
  end
end
