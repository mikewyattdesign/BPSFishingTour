require 'spec_helper'

describe 'Profiles' do
    describe 'New profile page' do
        before :each do
            visit '/profiles/new'
        end

        it 'should have the proper labels' do
            expect(page).to have_field('First name')
            expect(page).to have_field('Last name')
            expect(page).to have_field('Street address')
            expect(page).to have_field('Suite')
            expect(page).to have_field('City')
            expect(page).to have_field('State')
            expect(page).to have_field('Zip')
            expect(page).to have_field('Phone')
            expect(page).to have_field('Ext')
            expect(page).to have_field('Shirt')
            expect(page).to have_field('Outdoor rewards number')
        end

        it 'should have "Continue" as the submit button' do
            expect(page).to have_button('Continue')
        end
    end
end
