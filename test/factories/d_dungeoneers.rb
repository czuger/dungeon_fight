FactoryGirl.define do
  factory :d_dungeoneer do
    name "MyString"
    desc "MyString"
    fo 1
    coo 1
    mem 1
    vol 1
    c_class
    attack_item_id { create( :i_item ).id }
  end
end
