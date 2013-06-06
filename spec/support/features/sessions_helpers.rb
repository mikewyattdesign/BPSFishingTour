module Features
    module SessionHelpers
        def sign_in_with(email, password)
            visit '/'

            click_link :Login, match: :first
            fill_in :Email, with: email
            fill_in :Password, with: password

            click_button :Login
        end

        def sign_up_with(email, password)
            visit '/'

            click_link 'Sign up', match: :first
            fill_in :Email, with: email
            fill_in :Password, with: password
            fill_in 'Password confirmation', with: password
            click_button :GO

            confirm_registration!(email, last_email)
        end

        def confirm_registration!(user, confirmation_email)
            expect(confirmation_email.to).to include user
            expect(confirmation_email.body).to have_content("Welcome #{user}!")
            expect(confirmation_email.body).to have_link('Confirm my account')
            token = confirmation_email.to_s.match(/confirmation_token=(.+)"/)[1]
            visit "/users/confirmation?confirmation_token=#{token}"
            expect(page).to have_content 'Your account was successfully confirmed'
        end

        def sign_in_from_sign_in_page(email, password)
            fill_in :Email, with: email
            fill_in :Password, with: password

            click_button :Login
        end
    end
end