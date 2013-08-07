class Request < ActiveRecord::Base

    validates :requester, :invitee_email, :presence => true

    def invitation_url
        "#{Rails.application.routes.url_helpers.invite_response_path(self.id)}"
    end
end
