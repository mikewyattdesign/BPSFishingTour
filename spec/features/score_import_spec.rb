require 'spec_helper'

feature 'Score Import' do
    given! (:event) { FactoryGirl.create(:event) }
    given (:scores_csv) { Rails.root.join('spec', 'features', 'files', 'scores.csv') }

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
    end
end
