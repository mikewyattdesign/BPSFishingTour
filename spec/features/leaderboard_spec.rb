require 'spec_helper'

feature "Leaderboard" do
    scenario 'I visit the leaderboard' do
        visit '/leaderboard'
        expect(page).to have_content 'Leaderboard'
    end
end
