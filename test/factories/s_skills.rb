FactoryGirl.define do
  factory :s_skill do
    name "MyString"
    desc "MyString"
    difficulty 1

    first_attribute 'fo'
    second_attribute 'coo'
  end
end
