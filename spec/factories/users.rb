
FactoryGirl.define do
    factory :user do
        email "joe@example.com"
        password "secretpassword"
        confirmed_at Time.now
    end
end