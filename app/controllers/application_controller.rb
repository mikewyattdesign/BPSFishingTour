class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # after_filter :any_invites?

  def after_sign_in_path_for(resource)
      # if user is signing in after receiving an email to join a team take them to the invitations page
      return team_invitations_path(current_user) if session[:respond_to_invitation]
      unless current_user.profile
          thanks_path()
      else

          puts params
          if current_user.teams.empty?
            flash[:find_team_member] = "What's next? Find a teammate so you two can join some tournaments! #{ActionController::Base.helpers.link_to "Grab A Teammate", requests_new_path }".html_safe

            return profile_path(current_user)
          end
          "/"
      end
  end

  # def any_invites?
  #   if session[:pending_invites]
  #       flash[:team_invite] = "You have team invites pending <br>  #{ActionController::Base.helpers.link_to "View Invites", team_invitations_path(current_user)}"
  #   end

  # end
end
