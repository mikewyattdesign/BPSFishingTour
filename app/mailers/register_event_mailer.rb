class RegisterEventMailer < ActionMailer::Base
    default from: "do-not-reply@bassprofishingtour.com"

    layout 'mailer_layout'

    def event_registered( event, current_user )
        @event = event
        @current_user = current_user
        @team = current_user.teams.first
        @users = @team.users
        @emails = @users.map { |user| user.email }
        mail(to: @emails, subject: "Ready to reel!")
    end

end
