
FactoryGirl.define do
    factory :user do
        sequence(:email) { |n| "user#{n}@example.com" }
        password "secretpassword"
        confirmed_at Time.now
    end
end