class AnglersController < ApplicationController
    def index
        @directory = Profile.directory
    end
end