require 'spec_helper'

feature 'News' do
    scenario 'I want to view news in the system' do
        visit '/news'
        expect(page).to have_content 'News'
    end

    scenario 'Reading the competitive sports fishing league announcement' do
        visit '/news'
        click_link 'Competitive Sport Fishing League Announcement'
        expect(page).to have_content 'Competitive Sport Fishing League Announcement'
    end
end
