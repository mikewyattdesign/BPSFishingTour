class AdminController < ApplicationController
    layout 'bare'

    http_basic_authenticate_with name: 'Group360', password: 'scoreimport'
    def users_report
        @teams = Team.all
    end

    def users_table

        case params[:report_type]
        when 'no-profile'
            @users = User.select{|user| user.profile.nil? ||
                user.profile.first_name.blank? ||
                user.profile.last_name.blank?}
        when 'no-team'
            @users = User.select{|user| user.teams.empty?}
        else
            @users = User.all
        end

        @users = @users.reject{|user| user.nil?}

        respond_to do |format|
            format.xls
        end
    end

    def team_table
        @teams = Team.all
    end
end

