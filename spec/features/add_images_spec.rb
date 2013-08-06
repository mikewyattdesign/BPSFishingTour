require 'spec_helper'

feature "Add Images", js: true do
    given (:bob) { FactoryGirl.create(:user)}

    context "user with a teammate who has a profile picture" do
        given (:jane) { FactoryGirl.create(:user) }

        before(:each) do
            #bob and jane for a team
            bob.teams.create.users<<jane
            bob.profile.picture = File.open(Rails.root.join('spec', 'features', 'files', 'images.jpeg'))
            bob.profile.save(validate: false).should be_true

            # puts bob.profile.picture?
        end

        after(:each) do
            bob.profile.picture.destroy
        end

        scenario "profile photos are visible" do
            sign_in_with(bob.email, bob.password)
            expect(current_path).to eq "/myprofile"

            url = bob.profile.picture.url(:tour)
            expect(page.body).to have_css("img[src='#{url}']")
            bob.email = "bob@example.com"
        end

        scenario "team photos are visible" do
            sign_in_with(bob.email, bob.password)
            expect(current_path).to eq "/myprofile"
            visit '/team_select_profile_picture'
            attach_file 'team_team_picture', Rails.root.join('spec', 'features', 'files', 'images.jpeg')
            click_button 'Continue'

            url = bob.my_team.team_picture.url(:teampro)
            expect(page.body).to have_css("img[src='#{url}']")
        end



    end


end
