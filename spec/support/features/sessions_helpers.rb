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
    end
  end
end