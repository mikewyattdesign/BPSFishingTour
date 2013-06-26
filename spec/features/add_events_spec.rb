require 'spec_helper'

feature "Manage events" do
    given  (:user)  { FactoryGirl.create(:user) }
    given  (:team)  { FactoryGirl.create(:team) }
    given! (:event) { FactoryGirl.create(:event) }

    context "with a team" do
        background do
            user.teams << team
            expect(user.teams.count).to eq 1
            sign_in_with(user.email, user.password)
            click_link('Tour Events')
        end

        scenario "User can register for a new event" do
            expect {
                expect(page).to have_content('Chippawa, Upper Niagara')
                click_button('Yes')
                expect(page).to have_content("Your team is now registered to participate in #{Event.first.name}")
            }.to change{user.teams.first.events.count}.from(0).to(1)

            expect(current_path).to eq '/myprofile'
        end

        scenario "User should be able to unregister an event" do
            user.my_team.events << event
            expect(user.my_team.events.count).to eq 1

            expect {
                click_button('No')
            }.to change{user.my_team.events.count}.from(1).to(0)

            expect(current_path).to eq '/myprofile'
        end

        scenario "User should not be allowed to register an event they are already registered for" do
            expect {
                expect(page).to have_content('Chippawa, Upper Niagara')
                click_button('Yes') # add the event once
                click_link('Tour Events')
                click_button('Yes') # attempt to add the event again
                click_link('Tour Events')
                click_button('Yes') # But should not work
            }.to change{user.teams.first.events.count}.by(1)
        end
    end


    context "without a team" do
        background do
            expect(user.teams.count).to eq 0
        end

        scenario "User should not be able to register for an event with out a team" do
            sign_in_with(user.email, user.password)
            expect(current_path).to eq('/myprofile')
            click_link 'Tour Events'
            expect(page).to have_content('Chippawa, Upper Niagara')
            expect(page).to_not have_content('Is your team fishing in this event?')
        end
    end



end
