class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    before_filter :please_register
  # after_filter :any_invites?

    def after_sign_in_path_for(resource)
        return team_invitations_path(current_user) if session.delete(:respond_to_invitation)
        if !current_user.profile
            "/thanks"
        else
            if current_user.teams.empty?
                flash[:notice] = "What's next? Find a teammate so you two can join some tournaments! <a href=\"/teams/requests/new\">Grab A Teammate</a>"
                return "/myprofile"
            end

            "/myprofile"
        end
    end

    def please_register
        unless !user_signed_in? || view_context.is_registered?
            flash[:please_register] = 'You have not completed your registration, please navigate to \'Register\' to do so!'
        end
    end
end
 ##{ActionController::Base.helpers.link_to "the registration page", edit_profile_path(current_user.profile)}
