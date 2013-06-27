require 'spec_helper'

feature 'Thanks page' do
    background :each do
        user = FactoryGirl.create(:user)
        sign_in_with(user.email, user.password)
        visit '/thanks'
    end

    scenario 'should be thankful' do
        expect(page).to have_content('Thanks')
    end

    scenario 'should have a team create profile link' do
        expect(page).to have_link('Create Your Profile')
        # pending 'test for the href on the "register team" link'
    end
end
