require 'spec_helper'

describe Teams::RequestsController do
    describe 'Team Request form' do
        before :each do
            visit '/teams/requests/new'
        end

        it 'should have the proper labels' do
            expect(page).to have_field('First name')
            expect(page).to have_field('Last name')
            expect(page).to have_field('Email')
        end

        it 'should have "Login" as the submit button' do
            expect(page).to have_button('Continue')
        end

        pending 'Test submission of form, and display of potential users'
    end
end
