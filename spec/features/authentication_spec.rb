require 'spec_helper'

feature "authentication" do
    let(:user) { FactoryGirl.build(:user) }

    scenario "newly registered and confirmed user logs-in to site" do
        sign_up_with user.email, user.password
        click_link :Logout
        sign_in_with user.email, user.password
        expect(current_path).to eq '/myprofile'
    end

    scenario "user can register and confirm account" do
        sign_up_with(user.email, user.password)
        expect(current_path).to eq('/thanks')
    end

    scenario "user attempts to log in with wrong password" do
        sign_in_with user.email, 'wrongeffingpw'
        expect(current_path).to eq('/users/sign_in')
        expect(page).to have_content('Invalid email or password')
    end

    scenario "user goes to /join" do
        visit '/join'
        expect(current_path).to eq('/users/sign_up')
    end

    scenario "user navigates to /thanks when not logged in" do
        visit '/thanks'
        expect(current_path).to eq '/users/sign_in'
    end
end