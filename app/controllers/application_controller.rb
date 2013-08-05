class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

    before_filter :please_register
    before_filter :get_teammember
  # after_filter :any_invites?

    def after_sign_in_path_for(resource)
        return team_invitations_path(current_user) if session.delete(:respond_to_invitation)
            unless session[:return_to].blank?
                destination = session[:return_to]
                clear_stored_location
                destination
            else
                '/myprofile'
            end
    end

    def please_register
        unless !user_signed_in? || view_context.is_registered?
            flash[:please_register] = %Q[You have not completed your registration, please navigate to  <a href=\\"/profiles/#{current_user.profile.id}/edit\\">the registration page</a> to do so!]
        end
    end

    def get_teammember
        if current_user && !current_user.teammate
            flash[:find_a_teammate] = %Q[So, what's next? Find a teammate so you can register for tournament events! <a href=\\"/teams/requests/new\\">Grab A Teammate</a>]
        end
    end
end

