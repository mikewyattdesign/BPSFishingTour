class AnglersController < ApplicationController
    def index
        @fullads = true
        @directory = Profile.directory
    end
end