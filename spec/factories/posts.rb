# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user_id 1
    title "MyString"
    published false
    content "MyString"
    type ""
  end
end
