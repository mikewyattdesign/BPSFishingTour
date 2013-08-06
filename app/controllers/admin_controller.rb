class AdminController < ApplicationController
    layout 'bare'

    http_basic_authenticate_with name: 'Group360', password: 'scoreimport'
    def users_report

    end

end

