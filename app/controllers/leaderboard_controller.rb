class LeaderboardController < ApplicationController
    def index
        @fullads = true
        @boards = Leaderboard.boards
    end
end
