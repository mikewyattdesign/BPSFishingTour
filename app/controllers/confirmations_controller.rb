class ConfirmationsController < Devise::ConfirmationsController
    def after_confirmation_path_for(resource_name, resource)
        # check for the existence of an invitation in session
        # if there is one, delete it and associate the new user
        # with the invitation in the database
        if request_id = session.delete(:unregistered_invite)
            # find the Request record
            request = Request.find(request_id)
            # add the user to request
            request.invitee_id = current_user.id
            if request.save
                return team_invitations_path(current_user)
            end
        end
        # puts session.as_json
        thanks_path
    end
end