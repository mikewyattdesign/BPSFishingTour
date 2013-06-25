require 'spec_helper'

feature "Add Images" do
    let(:bob) { FactoryGirl.create(:user)}

    context "user with a teammate who has a profile picture" do
        given(:jane) { FactoryGirl.create(:user) }
        given(:teamA) { FactoryGirl.create(:team) }
        before(:each) {
            #bob and jane for a team
            bob.teams.create.users<<jane
            # jane adds a profile picture
            bob.profile.picture = File.open(Rails.root.join('spec', 'features', 'files', 'images.jpeg'))
            bob.profile.save(validate: false).should be_true
            # puts bob.profile.picture?
        }


        scenario "try to upload a team photo" do
            sign_in_with(bob.email, bob.password)
            expect(current_path).to eq "/myprofile"
            # puts bob.teams.first.users
            # puts send_invite_path
            page.should_not have_content "To register for an event, first you need to find a teammate!"
            page.body.should_not have_link "find a teammate!"
            url = bob.profile.picture.url(:tour)
            expect(page.body).to have_css("img[src='#{url}']")
        end



    end


end
