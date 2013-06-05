require 'spec_helper'
# in need of major refactor
feature "Teammate Request" do
    let(:requester) { FactoryGirl.create(:profile).user }
    let(:requestee) { FactoryGirl.build(:unregistered_user) }

    scenario "User sends team request" do
        sign_in_with(requester.email, requester.password)
        page.current_path.should eq "/profiles/#{requester.profile.id}"
        page.should have_content('What\'s next? Find a teammate so you two
            can join some tournaments!')
        click_link "Grab A Teammate"
        expect {send_teammate_request requestee.email }.to change{Request.count}.from(0).to(1)
        last_email.to.should include requestee.email
        last_email.subject.should have_content("#{requester.full_name}
            wants to go fishing!")
        page.current_path.should eq '/'
        last_email.body.should have_content("#{requester.profile.first_name}
            #{requester.profile.last_name} wants you on his team")
    end

    context "Receiving teammate request" do
        let(:request) { FactoryGirl.create(:request, requester: requester.id)}
        let(:registered_requestee) { FactoryGirl.create(:registered_user_2_profile).user}
        let(:request2) { FactoryGirl.create(:request, requester: requester.id, invitee_email: registered_requestee.email)}
        context "accept teammate invite" do
            scenario "as an unregistered user" do
                visit request.invitation_url
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

            scenario "as a non logged-in registered user" do
                visit request2.invitation_url
                page.current_path.should eq '/users/sign_in'
                sign_in_from_sign_in_page registered_requestee.email, registered_requestee.password
                page.current_path.should eq team_invitations_path(registered_requestee)
                 puts request2.as_json
                 puts requester.full_name
                 puts requester.id
                 puts User.all.as_json
                # puts registered_requestee.profile.as_json
                # puts Request.all.as_json
                expect(Request.count).to eq 1
                expect(page).to have_content("#{requester.full_name}")

            end
        end
    end
end