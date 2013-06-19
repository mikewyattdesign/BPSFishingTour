require 'spec_helper'

feature "Anglers" do
    given! (:steve) { FactoryGirl.create(:profile, first_name: 'Steve').user }
    scenario 'I want to view all current anglers in the system' do
        visit '/anglers'
        expect(page).to have_content "#{steve.profile.last_name}, #{steve.profile.first_name}"
    end
end
