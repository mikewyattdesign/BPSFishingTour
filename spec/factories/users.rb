
FactoryGirl.define do
    factory :user do
        sequence(:email) { |n| "user#{n}@example.com" }
        password "secretpassword"
        confirmed_at Time.now

        factory :user_with_profile do 
            after(:create) do |user|
                user.profile.update(FactoryGirl.attributes_for(:user_profile))
            end  
        end
    end
end