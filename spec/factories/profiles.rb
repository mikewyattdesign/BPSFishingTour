FactoryGirl.define do
    factory :profile, aliases: [:user_profile] do
        association     :user, factory: :user
        sequence(:first_name) { |n| "Joe#{n}"}
        sequence(:last_name) { |n| "Degrassi #{n}"}
        street_address '1234 Main Street'
        city           'St. Louis'
        zip            '63112'
        state          'MO'
        phone          '5555551234'
        sequence(:picture)         { |n| File.open(Rails.root.join('spec', 'features', 'files', "images#{n % 7}.jpeg"))}
    end
end
