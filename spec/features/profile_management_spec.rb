require 'spec_helper'

feature "profile_managment" do
    given(:user) {FactoryGirl.create(:user) }

    context "A newly created user" do
        scenario "should have one profile" do
            sign_in_with(user.email, user.password)
            expect(current_path).to eq '/'
            expect(user.profile).to_not be_nil
        end

        scenario "should have unedited profile" do
            sign_in_with(user.email, user.password)
            expect(user.profile.created_at).to eq(user.profile.updated_at)
        end

        scenario "should not update without valid information", :js => true do
            sign_in_with(user.email, user.password)
            click_link "Register"
            fill_in "First name", with: "Edu"
            click_button :Continue
            expect(page).to have_content("We could not update your profile!")
            expect(current_path).to eq "/profiles/#{user.id}"
        end
    end
end