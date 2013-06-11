require 'spec_helper'

feature "Manage events" do
    subject {FactoryGirl.create(:registered_user)}
    let(:team) {FactoryGirl.create(:team)}
    before(:each) do
      FactoryGirl.create(:event)
    end

    scenario "User can register for a new event" do
        subject.teams << team
        subject.teams.count.should eq 1
        sign_in_with(subject.email, subject.password)
        expect(current_path).to eq("/")
        click_link("Tour Events")
        expect{
            expect(page).to have_content("Chippawa, Upper Niagara")
            click_button("Details")
            click_link("Yes")
            expect(page).to have_content("Your team is now registered to participate in #{Event.first.name}")
            }.to change{subject.teams.first.events.count}.from(0).to(1)
    end
end
