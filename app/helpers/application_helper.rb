module ApplicationHelper
    def has_team?
        current_user.teams.exists?
    end

    def is_registered?
        if current_user.profile.valid?
            current_user.profile.errors.clear
            return true
        else
            return false
        end
    end
end
