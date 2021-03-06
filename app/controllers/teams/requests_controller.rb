class Teams::RequestsController < ApplicationController
    def new
            unless user_signed_in?
                store_location
                redirect_to new_user_session_path
            end
    end

    # def search
    #     if(@user = User.find_by_email(params[:email]))
    #         if !@user.hit_team_limit?
    #             # set message indicating their availability
    #             flash[:notice] = "Would you like to send #{ @user.full_name || @user.email } to team up with you?"
    #             @user
    #         else
    #             # set message indicating their unavailability
    #             flash[:notice] = "Sorry, but the user we found with this email address can't join anymore teams."
    #         end
    #     else
    #         flash[:notice] = "No such email in our database. Send them an invite."
    #         @unregistered_user = { first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}
    #     end
    # end

    def send_invite
        @request = Request.create({requester: current_user.id, invitee_email: params[:email]})
        if @request
            TeammateInviteMailer.sign_up_and_team_up(params[:email], current_user, "http://#{request.host_with_port}#{@request.invitation_url}").deliver
            TeammateInviteMailer.thanks(current_user.email).deliver
            flash[:notice] = "Your request has been sent to your teammate. If #{params[:email]} accepts, you may enter a tournament."
            redirect_to '/'
        end

    end

    def respond_to_invite
        @request = Request.where(id: params[:id]).first
        requester = User.where(id: @request.requester).first
        # see if the invitee already has an account
        if(invitee = User.where(email: @request.invitee_email).first)
            profile = invitee.profile
            @request.invitee_id = invitee.id
            if @request.save
                session[:respond_to_invitation] = true
                redirect_to new_user_session_path
            end
        else
            session[:unregistered_invite] = @request.id
            flash[:notice] = "Before teaming up with #{requester.full_name} you need to register an account."
            redirect_to new_user_registration_path
        end
        # render text: params
    end

    def team_invitations
        @invites = Request.where(invitee_id: current_user.id)
        # puts current_user.full_name
    end

    def accept_invitation
        request = Request.find params[:request_id]

        requester = User.find request.requester
        request.accepted = true
        request.replied_at = Time.now
        if request.save
            @team = Team.create.users<<([current_user, requester])
            TeammateInviteMailer.team_created([current_user.email, requester.email]).deliver
        end
       redirect_to my_profile_path
    end

    def reject_invitation

    end
end
