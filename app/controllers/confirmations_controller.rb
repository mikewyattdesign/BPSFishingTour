class ConfirmationsController < Devise::ConfirmationsController
    def after_confirmation_for(resource)
        after_sign_up_path_for(resource)
    end
end