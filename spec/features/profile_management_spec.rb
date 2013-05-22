require 'spec_helper'

feature "profile_managment" do
    subject { FactoryGirl.create(:user)}
    let(:profile) { FactoryGirl.build(:user_profile)}
    scenario "sign in and create profile" do
        sign_in_with(subject.email, subject.password)
        expect(current_path).to eq '/thanks'
        click_link "Create Your Profile"
        current_path.should eq '/profiles/new'

        fill_in 'First name', with: profile.first_name
        fill_in 'Last name', with: profile.last_name
        fill_in 'Street address', with: profile.street_address
        fill_in 'City', with: profile.city
        fill_in 'State', with: profile.state
        fill_in 'Zip', with: profile.zip
        click_button 'Continue'

        current_path.should eq '/teams/requests/new'
    end
end