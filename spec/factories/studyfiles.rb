# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :studyfile do
    filename "MyString"
    filetype 1
    download_count 1
    faverate_count 1
    file_url "MyString"
    user_id 1
    price "9.99"
  end
end
