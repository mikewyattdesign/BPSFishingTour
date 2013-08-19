class StaticPagesController < ApplicationController
    def home
        @board = Leaderboard.qualified_teams
    end

    def about
        @fullads = true
    end

    def events
        @board = Leaderboard.qualified_teams
    end

    def thanks
        authenticate_user!
        @user = current_user
    end

    def confirm
    end
end
