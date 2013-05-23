require 'spec_helper'

feature "authentication" do
  subject = FactoryGirl.attributes_for(:user)
  before(:each) do
    @joe = OpenStruct.new(subject)
  end

  scenario "newly registered and confirmed user logs-in to site" do
    FactoryGirl.create(:user)
    sign_in_with @joe.email, @joe.password
    expect(current_path).to eq '/thanks'
  end

  scenario "user can register and confirm account" do
    sign_up_with(@joe.email, @joe.password)
    last_email.to.should include @joe.email
    last_email.body.should have_content("Welcome joe@example.com!")
    last_email.body.should have_link('Confirm my account')
    token = last_email.to_s.match(/confirmation_token=(.+)"/)[1]
    visit "/users/confirmation?confirmation_token=#{token}"
    expect(current_path).to eq('/thanks')
  end

  scenario "user attempts to log in with wrong password" do
    sign_in_with @joe.email, "wrongeffingpw"
    expect(current_path).to  eq('/users/sign_in')
    expect(page).to have_content("Invalid email or password")
  end

end