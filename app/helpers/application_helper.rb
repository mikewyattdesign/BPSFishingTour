module ApplicationHelper
    def has_team?
        current_user.teams.exists?
    end

    def is_registered?
        if current_user.profile.valid?
            return true
        else
            current_user.profile.errors.clear
            return false
        end
    end
end
