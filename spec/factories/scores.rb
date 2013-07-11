# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score do
    event_id 1
    position 1
    angler "MyString"
    angler_rewards "MyString"
    co_angler "MyString"
    co_angler_rewards "MyString"
    weight "9.99"
    bf "9.99"
    hp "9.99"
  end
end
