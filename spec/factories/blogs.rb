# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    artical "MyText"
    user_id 1
    title "MyString"
  end
end
