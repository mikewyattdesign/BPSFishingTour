module Features
    module TeamRequest
        def send_team_request(first_name, last_name, email)

            page.current_path.should eq '/teams/requests/new'
            fill_in "First name", with: first_name
            fill_in "Last name", with:  last_name
            fill_in "Email", with:      email

            click_button "Continue"

        end
    end
end