require 'spec_helper'

feature "authentication" do
  subject(:dan) { User.new(
    email: "dan@example.com",
    password: "secretpassword"
      )}

  scenario "registered user logs-in successfully" do

    sign_up_with(dan.email, dan.password)

    pending 'Where should users go?'
  end

  scenario "user registers for the site" do
    sign_in_with dan.email, dan.password
    expect(current_path).to eq '/thanks'
  end

  def sign_up_with(email, password)
    dan.save
    visit '/'

    click_link :Login

    fill_in :Email, with: email

    fill_in :Password, with: password

    click_button "Login"
  end

  def sign_in_with(email, password)
    visit '/'

    click_link "Sign up"

    fill_in :Email, with: email

    fill_in :Password, with: password

    fill_in "Password confirmation", with: password

    click_button :GO
  end
end