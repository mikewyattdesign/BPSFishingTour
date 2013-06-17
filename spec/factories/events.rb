# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "Chippawa, Upper Niagara"
    country "Canada"
    postal_code "123456"
    date Time.now
  end
end
