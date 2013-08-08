require 'spec_helper'

feature "Profile managment" do
    scenario "User signs up and creates her profile" do
        user = FactoryGirl.build(:user)
        sign_up_with user.email, user.password
        expect(current_path).to eq '/thanks'

        click_link 'Create Your Profile'
        fill_in 'First name', with: 'Adam'
        fill_in 'Last name', with: 'Bowen'
        fill_in 'Street address', with: '123 Fake Street'
        fill_in 'City', with: 'St. Louis'
        fill_in 'State', with: 'MO'
        fill_in 'Zip', with: '63110'
        click_button 'Continue'

        expect(current_path).to eq '/teams/requests/new'
    end

    context "A newly created user" do
        given (:user) { FactoryGirl.create(:user) }

        scenario "should have one profile" do
            sign_in_with(user.email, user.password)
            expect(current_path).to eq '/myprofile'
            expect(user.profile).to_not be_nil
        end

        scenario "should have unedited profile" do
            sign_in_with(user.email, user.password)
            expect(user.profile.created_at).to eq(user.profile.updated_at)
        end

        scenario "should not update without valid information" do
            sign_in_with(user.email, user.password)
            click_link 'Register Team'
            fill_in 'First name', with: 'Edu'
            click_button :Continue
            expect(page).to have_content('We could not update your profile!')
            expect(current_path).to eq "/profiles/#{user.profile.id}"
        end

        scenario "visits her profile via /profiles/:id" do
            user = FactoryGirl.create(:profile).user
            sign_in_with user.email, user.password
            visit "/profiles/#{user.profile.id}"
            expect(current_path).to eq '/myprofile'
        end

        scenario "should return relevant validation errors" do
            sign_in_with user.email, user.password
            expect(current_path).to eq '/myprofile'
            click_link 'My Account'
            fill_in 'First name', with: " Bob"
            fill_in 'Last name', with: "Dole "
            fill_in 'Street address', with: ' 123 Main St'
            fill_in 'City', with: 'St. Louis '
            fill_in 'State', with: ' MO'
            fill_in 'Zip', with: ' 56222 '
            click_button 'Submit'
            expect(current_path).to eq "/profiles/#{user.profile.id}"

            expect(page).to have_content('errors prohibited this profile from being saved:')

            [
                'First name',
                'Last name',
                'Street address',
                'City',
                'State',
                'Zip'
            ].each do |attribute|  
                expect(page).to have_content("#{attribute} - please remove trailing and/or leading whitespace")
            end


        end

        scenario "should return to /myprofile view after validation error" do 
            sign_in_with user.email, user.password
            expect(current_path).to eq '/myprofile'
            click_link 'My Account'
            fill_in 'First name', with: 'Edu'
            click_button 'Submit'
            expect(current_path).to eq "/profiles/#{user.profile.id}"
            expect(page).to have_content("Account Information")
        end

        scenario "Should not show 'best-in-place' view after validation error" do 
            sign_in_with user.email, user.password
            expect(current_path).to eq '/myprofile'
            click_link 'My Account'
            fill_in 'First name', with: 'Edu'
            click_button 'Submit'
            expect(current_path).to eq "/profiles/#{user.profile.id}"
            # image we are testing for
            url = '/assets/iconWriteLight.png'
            expect(page).to_not have_css("img[src='#{url}']")
        end
    end
end