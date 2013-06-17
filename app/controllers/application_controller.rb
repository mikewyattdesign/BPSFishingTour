class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # after_filter :any_invites?

  def after_sign_in_path_for(resource)
      if !current_user.profile
          "/thanks"
      else
          if current_user.teams.empty?
            flash[:notice] = "What's next? Find a teammate so you two can join some tournaments! #{ActionController::Base.helpers.link_to "Grab A Teammate", requests_new_path }".html_safe
            return "/"
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
