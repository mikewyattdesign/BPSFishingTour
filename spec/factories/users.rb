
FactoryGirl.define do
    factory :user do
        email "joe@example.com"
        password "secretpassword"

        factory :registered_user do
            confirmed_at Time.now
        end

        factory :registered_user_2 do
            email "dondoe@example.com"
            confirmed_at Time.now
        end

        factory :unregistered_user do
            email "unregistered@example.com"
        end
    end
end