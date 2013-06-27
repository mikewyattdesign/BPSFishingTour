class StaticPagesController < ApplicationController
    def home
    end

    def about
        @fullads = true
    end

    def events
    end

    def thanks
        authenticate_user!
        @user = current_user
    end

    def confirm
    end
end
