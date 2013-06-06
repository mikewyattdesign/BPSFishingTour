require 'spec_helper'

feature "profile_managment" do
    given(:profile) { OpenStruct.new FactoryGirl.attributes_for(:user_profile) }
    given(:user) { OpenStruct.new FactoryGirl.attributes_for(:user) }

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

            click_link :Logout
            sign_in_with(user.email, user.password)
            expect(current_path).to eq "/profiles/#{User.where(email: user.email).first.id}"
        end
    end
end