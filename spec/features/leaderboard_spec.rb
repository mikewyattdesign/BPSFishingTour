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
end
