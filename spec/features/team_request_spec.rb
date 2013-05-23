require 'spec_helper'

feature "Create a Team" do
    subject(:requester) { FactoryGirl.create(:profile).user }
    let!(:requestee) { FactoryGirl.build(:unregistered_user) }

    scenario "User would like to add unregistered individual to his team" do

        sign_in_with(requester.email, requester.password)
        page.current_path.should eq '/'
        page.should have_content('What\'s next? Find a teammate so you two can join some tournaments!')
        click_link "Grab A Teammate"

        page.current_path.should eq '/teams/requests/new'

        fill_in "First name", with: "don"
        fill_in "Last name", with: "Stevies"
        fill_in "Email", with: requestee.email

        click_button "Continue"

        page.current_path.should eq '/'
    end
end