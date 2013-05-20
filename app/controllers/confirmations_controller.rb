class ConfirmationsController < Devise::ConfirmationsController
    def after_confirmation_for(resource)
        thanks_path
    end
end