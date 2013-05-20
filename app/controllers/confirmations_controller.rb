class ConfirmationsController < Devise::ConfirmationsController
    def after_confirmation_path_for(resource_name, resource)
        thanks_path
    end
end