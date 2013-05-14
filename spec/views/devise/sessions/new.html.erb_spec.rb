require 'spec_helper'

describe 'Login form' do
    before :each do
        visit '/login'
    end

    it 'should have the proper labels' do
        expect(page).to have_content('Email')
        expect(page).to have_content('Password')
    end

    it 'should have "Login" as the submit button' do
        expect(page).to have_button('Login')
    end

    it 'should have the "Forgot your password?" link' do
        # have_link is stupid, and requires the link text.  However,
        # that seems a bit overly-fragile to me, so I'm omitting it.
        expect(page).to have_link('', href: '/users/password/new')
    end

    it 'should have the "Register" link' do
        expect(page).to have_link('', href: '/register')
    end
end
