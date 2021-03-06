require 'spec_helper'

feature "Leaderboard" do
    scenario 'I visit the leaderboard' do
        visit '/leaderboard'
        expect(page).to have_content 'Leaderboard'
    end

    scenario 'I expect to see scores' do
        score = FactoryGirl.create(:score_with_team)
        visit '/leaderboard'
        expect(page).to have_content 'Total Score'
    end

    scenario 'I expect to have 5 scores' do
        event = FactoryGirl.create(:event_with_scores, scores: 2)
        team = event.teams.first
        score = FactoryGirl.create(:score_with_specific_team, team: team)
        visit '/leaderboard'
    end

    scenario 'I expect a tour bus to roll up' do
        num_divisions = 2
        num_events = 3
        num_teams = 5
        FactoryGirl.create_list(:team_with_users, num_teams)
        FactoryGirl.create_list(:division_with_full_events, num_divisions, events: num_events, make_teams: false)
        visit '/leaderboard'
        click_link "#{Event.first.teams.first.users.first.full_name}"
    end

    scenario 'I expect to see team pictures in the profile leaderboard' do
        FactoryGirl.create(:division_with_full_events)
        visit "/profiles/1"
        within(:css, ".small-scores-container") do
            url = Team.first.team_picture.url
            expect(page).to have_css("img[src='#{url}']")
        end
    end

    scenario 'I expect profiles with scores to be linked on the event scores page' do
        event = FactoryGirl.create(:event_with_scores)
        visit "/event-scores/#{event.id}"
        click_link "#{Event.first.teams.first.users.first.full_name.upcase}"
        expect(current_path).to eq("/profiles/#{Event.first.teams.first.users.first.profile.id}")
    end

end
