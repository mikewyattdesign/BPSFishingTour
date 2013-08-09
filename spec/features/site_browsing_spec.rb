require 'spec_helper'

feature "Browsing the site" do 
	scenario 'Should see "No Team Photo" on profile pages w/o team photo' do 
		user = FactoryGirl.create(:user_with_profile)
	    visit '/anglers'
        click_link user.full_name('l f')
        expect(current_path).to eq "/profiles/#{user.profile.id}"
        expect(page).to have_no_content "Upload a Team Photo Here"
        expect(page).to have_no_content "Go to My Team Profile to upload a Team Photo"
        expect(page).to have_no_content "Upload a Profile Picture"
        expect(page).to have_content "No Team Photo"
	end

	
end