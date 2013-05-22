require 'spec_helper'

feature "profile_managment" do
    # our 
    subject { FactoryGirl.create(:user)}
    scenario "sign in with the correct credentials" do

        sign_in_with(subject.email, subject.password)
        expect(current_path).to eq '/thanks'
        click_link "Register your team"
        puts current_path
        # register my team should be "Fill my profile" 
        # What does the profile fill page look like?
        # form or a series of questions
    end
end