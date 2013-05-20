class RegistrationsController < Devise::RegistrationsController
    def after_sign_up_path_for(resource)
        thanks_path
    end

    def after_inactive_sign_up_path_for(resource)
        confirm_path
    end
end
