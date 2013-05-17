require 'spec_helper'

feature "login process" do
  subject(:dan) { User.new(
    email: "dan@example.com",
    password: "secretpassword"
      )}

  scenario "registered user logs in successfully" do
    dan.save
    visit '/'

    click_link :Login

    fill_in :Email, with: dan.email

    fill_in :Password, with: dan.password

    click_button "Login"

    expect(page).to have_text("Edit User")
  end

  scenario "user registers for the site" do

    visit '/'

    click_link "Sign up"

    fill_in :Email, with: dan.email

    fill_in :Password, with: dan.password

    fill_in "Password confirmation", with: dan.password

    click_button :GO

    expect(page).to have_text("Edit User")
  end
end