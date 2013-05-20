require 'spec_helper'

feature "authentication" do
  subject(:dan) { User.new(
    email: "dan@example.com",
    password: "secretpassword"
      )}
    # Joe is our register and confirmed guy
    let(:joe) { User.create(email: "eduerondu@gmail.com", password: "supersecrety", confirmed_at: "2013-05-20 20:49:50")}

  # scenario "registered user logs-in successfully" do

  #   sign_up_with(dan.email, dan.password)

  #   pending 'Where should users go?'
  # end

  scenario "registered and confirmed user logs-in to site" do
    sign_in_with joe.email, joe.password
    expect(current_path).to eq '/'

  end

  scenario "user can register and confirm account" do
    ActionMailer::Base.deliveries.clear
    sign_up_with(dan.email, dan.password)
    expect(ActionMailer::Base.deliveries.size).to eq 1
    expect(ActionMailer::Base.deliveries.last).to have_content("Welcome dan@example.com!")
    expect(ActionMailer::Base.deliveries.last).to have_link('Confirm my account')
    token = ActionMailer::Base.deliveries.last.to_s.match(/confirmation_token=(.+)"/)[1]

    visit "/users/confirmation?confirmation_token=#{token}"
    expect(current_path).to eq('/thanks')
  end

  scenario "user attempts to log in with wrong password" do
    sign_in_with joe.email, "wrongeffingpw"

    expect(current_path).to  eq('/users/sign_in')
    expect(page).to have_content("Invalid email or password")
  end

end