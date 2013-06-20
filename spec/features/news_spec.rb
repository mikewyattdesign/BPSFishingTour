require 'spec_helper'

feature 'News' do
    scenario 'I want to view all current anglers in the system' do
        visit '/news'
        expect(page).to have_content 'news'
    end
end
