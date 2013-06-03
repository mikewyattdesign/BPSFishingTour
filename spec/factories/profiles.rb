FactoryGirl.define do
    factory :profile, aliases: [:user_profile] do
        association     :user, factory: :registered_user
        first_name    "Joe"
        last_name     "Daggrassi"
        street_address "1234 Main Street"
        city           "St. Louis"
        zip            "63112"
        state          "MO"
        phone          "5555551234"


        factory :registered_user_2_profile do
            association :user, factory: :registered_user_2
        end
    end
end