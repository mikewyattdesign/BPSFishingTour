class NewsController < ApplicationController
    def index
        @fullads = true
    end

    def story
        # this should pay attention to year, month, day as well
        @boards = Leaderboard.boards
        render params[:title]
    end
end
