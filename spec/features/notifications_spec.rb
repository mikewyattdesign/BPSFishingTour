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
        visit '/events'
        expect(page.body).to have_content 'We need to know your name'
    end

    scenario "I don't have a teammate yet" do
        user.profile.first_name = 'Dude'
        user.profile.last_name = 'Ellington'
        user.profile.street_address = '123 Fake st.'
        user.profile.city = 'St. Louis'
        user.profile.state = 'MO'
        user.profile.save!
        sign_in_with user.email, user.password
        expect(page.body).to have_content 'we need you to request a teammate'
        visit '/leaderboard'
        expect(page.body).to have_content 'we need you to request a teammate'
        visit '/events'
        expect(page.body).to have_content 'we need you to request a teammate'

        visit '/teams/requests/new'
        fill_in 'email', with: 'test@example.com'
        click_button 'Continue'
        visit '/myprofile'
        expect(page.body).to have_content 'your teammate must accept your invitation'
        visit '/leaderboard'
        expect(page.body).to have_content 'your teammate must accept your invitation'
        visit '/events'
        expect(page.body).to have_content 'your teammate must accept your invitation'
    end

    scenario "I don't have an outdoor rewards number" do
        team = FactoryGirl.create :team_with_users
        sign_in_with team.users.first.email, team.users.first.password
        expect(page.body).to have_content 'We need to know your Outdoor Rewards'
    end
end
