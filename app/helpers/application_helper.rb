module ApplicationHelper
    def has_team?
        current_user.teams.exists?
    end

    def is_registered?
        if current_user.profile.created_at != current_user.profile.updated_at
            return true
        else
            return false
        end
    end
end
