
FactoryGirl.define do
    factory :user do
        email "joe@example.com"
        password "secretpassword"
        confirmed_at Time.now

        factory :unregistered_user do
            email "don@example.com"
            password "sensitivestuff"
        end
    end
end