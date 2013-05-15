require 'spec_helper'

describe 'Thanks page' do
    before :each do
        visit '/thanks'
    end

    it 'should be thankful' do
        expect(page).to have_content('Thanks')
    end

    it 'should have a team registration link' do
        expect(page).to have_link('Register your team')
        pending 'test for the href on the "register team" link'
    end

    it 'should have a skip team registration link' do
        expect(page).to have_link('Skip')
        pending 'test for the href on the "skip team registration" link'
    end
end
