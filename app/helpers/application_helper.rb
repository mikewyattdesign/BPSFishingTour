module ApplicationHelper
    def has_team?
        current_user.teams.exists?
    end
end
