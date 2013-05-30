require 'spec_helper'
# in need of major refactor
feature "Teammate Request" do
        let(:requester) { FactoryGirl.create(:profile).user }
        let(:requestee) { FactoryGirl.build(:unregisterd_user) }

    context "User sends team request" do
        scenario "to unregistered user" do

            sign_in_with(requester.email, requester.password)
            page.current_path.should eq '/'
            page.should have_content('What\'s next? Find a teammate so you two
                can join some tournaments!')
            click_link "Grab A Teammate"
            expect {send_team_request requestee.email }.to change{Request.count}.from(0).to(1)
            last_email.to.should include requestee.email
            last_email.subject.should have_content("#{requester.full_name}
                wants to go fishing!")
            page.current_path.should eq '/'
            last_email.body.should have_content("#{requester.profile.first_name}
                #{requester.profile.last_name} wants you on his team")
        end
    end

    context "Receiving teammate request" do
        let(:request) { FactoryGirl.create(:request, requester: requester.id)}
        context "accept teammate invite" do
            scenario "as an unregistered user" do
                visit request.acceptance_url
                page.current_path.should eq '/users/sign_up'
                # register and confirm
                sign_up_with(requestee.email, requestee.password)
                # the invitee_id of the request record should now
                # be equal to the id of the last registered user
                expect(Request.first.invitee_id).to eq User.last.id

                page.current_path.should eq "/users/#{User.find_by_email(requestee.email).id}/team_invitations"
                expect(page).to have_content("#{requester.full_name}")

                expect{ click_link "Accept Invitation" }.to change{Team.count}.from(0).to(1)

                expect(Team.first.users.count).to eq 2
            end
        end
    end

end