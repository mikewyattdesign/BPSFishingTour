require 'spec_helper'
# in need of major refactor
feature "Teammate Request" do
    let!(:bob) { FactoryGirl.create(:profile).user }
    let(:tom) { OpenStruct.new FactoryGirl.attributes_for(:user) }

    scenario "User sends team request" do
        sign_in_with(bob.email, bob.password)
        page.current_path.should eq "/myprofile"
        page.should have_content('Find a teammate')
        visit '/teams/requests/new'
        expect {send_teammate_request tom.email }.to change{Request.count}.from(0).to(1)
        expect(emails.first.to).to include tom.email
        expect(emails.last.to).to include bob.email
        emails.first.body.should have_link('Click here to sign yourself up')
        page.current_path.should eq '/'
        emails.first.body.should have_content("#{bob.full_name} invited you to become")
    end

    context "Receiving teammate request" do
        let(:request) { FactoryGirl.create(:request, requester: bob.id, invitee_email: tom.email)}

        context "accept teammate invite" do
            scenario "as an unregistered user" do
                visit request.invitation_url
                page.current_path.should eq '/users/sign_up'
                # register and confirm
                sign_up_with(tom.email, tom.password)
                # the invitee_id of the request record should now
                # be equal to the id of the last registered user
                expect(Request.first.invitee_id).to eq User.last.id

                page.current_path.should eq "/users/#{User.find_by_email(tom.email).id}/team_invitations"
                expect(page).to have_content("#{bob.full_name}" || "#{bob.email}")

                expect{ click_link "Accept Invitation" }.to change{Team.count}.from(0).to(1)
                # puts Request.count
                expect(Team.first.users.count).to eq 2
            end

            scenario "as a non logged-in registered user" do
                sign_up_with(tom.email, tom.password)
                click_link :Logout
                visit request.invitation_url
                expect(current_path).to eq '/users/sign_in'

                sign_in_with tom.email, tom.password
                expect(current_path).to eq team_invitations_path(User.find_by_email(tom.email).id)

                expect(Request.count).to eq 1
                expect(page).to have_content("#{bob.profile.first_name}")
            end
        end
    end
end
