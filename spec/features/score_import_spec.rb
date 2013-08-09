require 'spec_helper'

feature 'Score Import' do
    given! (:event) { FactoryGirl.create :event }
    given (:scores_csv) { Rails.root.join 'spec', 'features', 'files', 'scores.csv' }
    given! (:angler) { FactoryGirl.create(:user_with_profile).profile }
    given! (:co_angler) { FactoryGirl.create(:user_with_profile).profile}
    given! (:team) { FactoryGirl.create :team }

    before do
        angler.update(first_name: 'Cory', last_name: 'Johnston')
        co_angler.update(first_name: 'Chris', last_name: 'Johnston')
        team.users << angler.user
        team.users << co_angler.user
    end

    scenario 'I import a score' do
        visit '/scores'
        expect(page.status_code).to eq 401
        basic_auth 'Group360', 'scoreimport'
        visit '/scores'
        puts page.body unless page.status_code == 200
        expect(page.status_code).to eq 200
        attach_file 'file', scores_csv
        click_button 'Import'
        expect(page.current_url).to include "/scores?event_id=#{event.id}"
        expect(page.body).to have_content 'CORY JOHNSTON'
        expect(page.body).to have_content 'CHRIS JOHNSTON'
        expect(page.body).to have_content '42639102'
        expect(page).to have_content "First name matches:#{angler.first_name} #{angler.last_name}"

        within(:css, "tbody tr:nth-child(1) td:nth-child(9)") do
            click_link "#{angler.first_name} #{angler.last_name}", match: :first
        end

        expect(page).to have_content "✓ #{angler.first_name} #{angler.last_name}"

        expect(page).to have_content "First name matches:#{co_angler.first_name} #{co_angler.last_name}"

        within(:css, "tbody tr:nth-child(1) td:nth-child(10)") do
            click_link "#{co_angler.first_name} #{co_angler.last_name}", match: :first
        end

        expect(page).to have_content "✓ #{co_angler.first_name} #{co_angler.last_name}"
        expect(page).to have_content "✓ #{angler.first_name} #{angler.last_name}"

        visit '/leaderboard'
        expect(page).to have_content "#{angler.first_name} #{angler.last_name}"
        expect(page).to have_content "#{co_angler.first_name} #{co_angler.last_name}"
    end
end
