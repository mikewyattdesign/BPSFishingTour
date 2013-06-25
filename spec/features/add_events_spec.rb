require 'spec_helper'

feature "Manage events" do
    subject {FactoryGirl.create(:user)}
    let(:team) {FactoryGirl.create(:team)}
    let!(:event) {FactoryGirl.create(:event)}


    scenario "User can register for a new event" do
        subject.teams << team
        subject.teams.count.should eq 1
        sign_in_with(subject.email, subject.password)
        expect(current_path).to eq("/myprofile")
        click_link("Tour Events")
        expect{
            expect(page).to have_content("Chippawa, Upper Niagara")
            click_button("Yes")
            expect(page).to have_content("Your team is now registered to participate in #{Event.first.name}")
            }.to change{subject.teams.first.events.count}.from(0).to(1)
    end

    scenario "User should be able to unregister an event" do
        subject.teams << team
        subject.my_team.events << event
        subject.my_team.events.count.should eq 1
        sign_in_with subject.email, subject.password
        click_link("Tour Events")
        expect{
            click_button("No")
        }.to change{subject.my_team.events.count}.from(1).to(0)

    end

    scenario "User should not be able to register for an event with out a team" do
        subject.teams.count.should eq 0
        sign_in_with(subject.email, subject.password)
        expect(current_path).to eq('/myprofile')
        click_link "Tour Events"
        expect(page).to have_content("Chippawa, Upper Niagara")
        expect(page).to_not have_content("Is your team fishing in this event?")
    end


    scenario "User should not be allowed to register an event they are already registered for" do
        subject.teams << team
        subject.teams.count.should eq 1
        sign_in_with(subject.email, subject.password)
        click_link("Tour Events")
        expect{
            expect(page).to have_content("Chippawa, Upper Niagara")
            click_button("Yes") # add the event once
            click_button("Yes") # attempt to add the event again
            click_button("Yes") # But should not work
            }.to change{subject.teams.first.events.count}.by(1)
    end

end
