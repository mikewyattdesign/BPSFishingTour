require 'spec_helper'

describe 'Registration form' do
    before :each do
        visit '/register'
    end

    it 'should have the proper labels' do
        expect(page).to have_field('Email')
        expect(page).to have_field('Password')
        expect(page).to have_field('Password confirmation')
    end

    it 'should have "Login" as the submit button' do
        expect(page).to have_button('GO')
    end

    it 'should have the "Login" link' do
        expect(page).to have_link('', href: '/login')
    end

    it 'should have the "Forgot password?" link' do
        expect(page).to have_link('', href: '/users/password/new')
    end
end
