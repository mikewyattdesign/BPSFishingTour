require 'spec_helper'

describe 'Forgot password form' do
    before :each do
        visit '/users/password/new'
    end

    it 'should have the proper labels' do
        expect(page).to have_field('Email')
    end

    it 'should have "Login" as the submit button' do
        expect(page).to have_button('Send Request')
    end

    it 'should have the "Login" link' do
        expect(page).to have_link('', href: '/login')
    end

    it 'should have the "Register" link' do
        expect(page).to have_link('', href: '/register')
    end
end
