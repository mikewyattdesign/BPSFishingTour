require 'spec_helper'

feature 'News' do
    scenario 'I want to view news in the system' do
        visit '/news'
        expect(page).to have_content 'News'
    end
end
