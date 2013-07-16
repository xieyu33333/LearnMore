# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    name "MyString"
    content "MyText"
    user_id 1
    forum_id 1
    status 1
    digg 1
  end
end
