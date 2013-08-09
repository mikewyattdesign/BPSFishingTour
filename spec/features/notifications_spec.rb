require 'spec_helper'

feature "Notifications" do
    given! (:user) { FactoryGirl.create :user }

    scenario "I don't have my name in my profile" do
        sign_in_with user.email, user.password
        expect(page.body).to have_content 'We need to know your name'
        visit '/anglers'
        expect(page.body).to have_content 'We need to know your name'
        visit '/leaderboard'
        expect(page.body).to have_content 'We need to know your name'
    end
end
