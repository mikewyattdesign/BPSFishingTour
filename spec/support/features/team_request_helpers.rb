module Features
    module TeamRequest
        def send_team_request(email)

            page.current_path.should eq '/teams/requests/new'
            fill_in "Email", with:      email

            click_button "Continue"

        end
    end
end