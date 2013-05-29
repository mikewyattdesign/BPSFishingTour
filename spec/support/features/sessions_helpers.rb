module Features
  module SessionHelpers
    def sign_in_with(email, password)
      # sign_up_with(email, password)
      visit '/'

      click_link :Login

      fill_in :Email, with: email

      fill_in :Password, with: password

      click_button "Login"
    end

    def sign_up_with(email, password)
      visit '/'

      click_link "Sign up"

      fill_in :Email, with: email

      fill_in :Password, with: password

      fill_in "Password confirmation", with: password
      click_button :GO

      last_email.to.should include email

      last_email.body.should have_content("Welcome #{email}!")
      last_email.body.should have_link('Confirm my account')
      token = last_email.to_s.match(/confirmation_token=(.+)"/)[1]
      visit "/users/confirmation?confirmation_token=#{token}"
    end
  end
end