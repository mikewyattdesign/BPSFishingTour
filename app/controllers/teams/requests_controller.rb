class Teams::RequestsController < ApplicationController
    def new
    end

    def search
        if(@user = User.find_by_email(params[:email]))
            if !@user.hit_team_limit?
                # set message indicating their availability
                flash[:notice] = "Would you like to send #{ @user.full_name || @user.email } to team up with you?"
                @user
            else
                # set message indicating their unavailability
                flash[:notice] = "Sorry, but the user we found with this email address can't join anymore teams."
            end
        else
            flash[:notice] = "No such email in our database. Send them an invite."
            @unregistered_user = { first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}
        end
    end

    def send_invite
        @invitee = OpenStruct.new params[:user]
        @request = Request.create({requester: current_user.id, invitee: @invitee.email})
        if @request
            TeammateInviteMailer.sign_up_and_team_up(@invitee.first_name, @invitee.last_name, @invitee.email, current_user, @request.acceptance_url).deliver
            flash[:notice] = "Your request has been sent to your teammate. If #{@invitee.first_name} #{@invitee.last_name} accepts, you may enter a tournament."
            redirect_to '/'
        end

    end
end
