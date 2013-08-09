require 'spec_helper'

feature "Anglers" do
    given! (:steve) { FactoryGirl.create(:profile, first_name: 'Steve') }

    scenario 'I want to view all current anglers in the system' do
        visit '/anglers'
        expect(page).to have_link "#{steve.last_name}, #{steve.first_name}", "/profiles/#{steve.id}"
    end
end
