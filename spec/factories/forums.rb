# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :forum do
    name "MyString"
    urlname "MyString"
    description "MyString"
    rule "MyString"
    parent_id 1
  end
end
