class TeamsController < ApplicationController
    def index
    end

    def create
        render :text => params
    end

    def invite_teammate
        render :text => params
    end
end
