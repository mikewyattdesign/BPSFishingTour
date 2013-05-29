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


    end

    # factory :unregister_profile do
    #     unregisterd_user
    #     first_name      "don"
    #     last_name       "Stevies"
    # end
end