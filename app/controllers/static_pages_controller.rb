class StaticPagesController < ApplicationController
    def home
    end

    def about
    end

    def events
    end

    def thanks
        @user = current_user
    end

    def confirm
    end
end
