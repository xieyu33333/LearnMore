# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :blog do
    artical "MyText"
    user_id 1
    title "MyString"
  end
end
