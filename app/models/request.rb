class Request < ActiveRecord::Base


    def invitation_url
        "#{Rails.application.routes.url_helpers.invite_response_path(self.id)}"
    end
end
