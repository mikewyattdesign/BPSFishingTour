require 'spec_helper'

feature 'Score Import' do
    given! (:event) { FactoryGirl.create :event }
    given (:scores_csv) { Rails.root.join 'spec', 'features', 'files', 'scores.csv' }
    given! (:angler) { FactoryGirl.create :user_profile, first_name: 'Cory', last_name: 'Johnston' }
    given! (:co_angler) { FactoryGirl.create :user_profile, first_name: 'Chris', last_name: 'Johnston' }
    given! (:team) { FactoryGirl.create :team }

    before do
        team.users << angler.user
        team.users << co_angler.user
    end

    scenario 'I import a score' do
        visit '/scores'
        expect(page.status_code).to eq 401
        basic_auth 'Group360', 'scoreimport'
        visit '/scores'
        expect(page.status_code).to eq 200

        attach_file 'file', scores_csv
        click_button 'Import'
        expect(page.current_url).to include "/scores?event_id=#{event.id}"
        expect(page.body).to have_content 'CORY JOHNSTON'
        expect(page.body).to have_content 'CHRIS JOHNSTON'
        expect(page.body).to have_content '42639102'
        expect(page).to have_content "First name matches:#{angler.first_name} #{angler.last_name}"

        click_link "#{angler.first_name} #{angler.last_name}", match: :first
        expect(page).to have_content "✓ #{angler.first_name} #{angler.last_name}"

        expect(page).to have_content "First name matches:#{co_angler.first_name} #{co_angler.last_name}"

        click_link "#{co_angler.first_name} #{co_angler.last_name}", match: :first
        expect(page).to have_content "✓ #{co_angler.first_name} #{co_angler.last_name}"

        # TODO: Team these guys up and get this working
        # visit '/leaderboard'
        # expect(page).to have_content "#{angler.first_name} #{angler.last_name}"
        # expect(page).to have_content "#{co_angler.first_name} #{co_angler.last_name}"
    end
end
