FactoryGirl.define do
    factory :team do
		sequence(:team_picture)		{ |n| File.open(Rails.root.join('spec', 'features', 'files', "images#{n%7}.jpeg"))}
		
		factory :team_with_users do 
			users {[FactoryGirl.create(:profile).user, FactoryGirl.create(:profile).user]}
		end

    end
end