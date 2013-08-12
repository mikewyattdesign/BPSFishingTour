FactoryGirl.define do
    factory :team do
		sequence(:team_picture)		{ |n| File.open(Rails.root.join('spec', 'features', 'files', "images#{n%7}.jpeg"))}

		factory :team_with_users do
			users {[FactoryGirl.create(:user_with_profile), FactoryGirl.create(:user_with_profile)]}
		end

    end
end
