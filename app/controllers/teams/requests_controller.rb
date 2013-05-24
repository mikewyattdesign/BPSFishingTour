class Teams::RequestsController < ApplicationController
    def new
    end
    def search
        if(@user = User.find_by_email params[:email])
            if !@user.hit_team_limit?
                # set message indicating their availability
                flash[:notice] = "Would you like to send #{ @user.full_name || @user.email } to team up with you?"
                @user
            else
                # set message indicating their unavailability
                flash[:notice] = "Sorry, but the user we found with this email address can't join anymore teams."
            end
        else
            flash[:notice] = "We don't have the email address \'#{params[:email]}\' in our database. But no worries, send #{params[:first_name]} an invite to join and team up!"
            @unregistered_user = { first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}
        end
    end
end
