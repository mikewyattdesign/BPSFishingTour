class ConfirmationsController < Devise::ConfirmationsController
    def after_confirmation_path_for(resource_name, resource)
        flash[:team_invite] = "You have 1 team invite pending <br>  #{ActionController::Base.helpers.link_to "View Invites", "#"}" if session[:unregistered_invite]
        # puts session.as_json
        thanks_path
    end
end