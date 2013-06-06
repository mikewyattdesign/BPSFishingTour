require 'spec_helper'

feature "profile_managment" do
    given(:profile) { FactoryGirl.build(:user_profile)}
    given(:user) { profile.user }

    context "User with no profile created" do
        scenario "sign in and create profile" do
            sign_up_with(user.email, user.password)
            expect(page).to have_content 'Thanks'
            expect(current_path).to eq '/thanks'

            click_link 'Create Your Profile'
            expect(current_path).to eq '/profiles/new'

            fill_in 'First name', with: profile.first_name
            fill_in 'Last name', with: profile.last_name
            fill_in 'Street address', with: profile.street_address
            fill_in 'City', with: profile.city
            fill_in 'State', with: profile.state
            fill_in 'Zip', with: profile.zip

            click_button 'Continue'
            expect(current_path).to eq '/teams/requests/new'
        end
    end

    context "User with a profile already created" do
        given(:user_with_profile) { FactoryGirl.create(:user_profile).user }

        scenario "signs in and is asked to create a team" do
            sign_in_with(user_with_profile.email, user_with_profile.password)
            expect(current_path).to eq '/' # for the moment its going to root
        end
    end
end