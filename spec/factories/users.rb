
FactoryGirl.define do
    factory :user do
        email "joe@example.com"
        password "secretpassword"

        factory :registered_user do
            confirmed_at Time.now
        end

        factory :unregisterd_user do
            email "unregisterd@example.com"
        end
    end
end