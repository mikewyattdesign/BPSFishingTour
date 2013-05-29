class Request < ActiveRecord::Base


    def acceptance_url
        "#{Rails.application.routes.url_helpers.invite_response_path(self.id)}"
    end
end
