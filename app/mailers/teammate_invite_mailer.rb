class TeammateInviteMailer < ActionMailer::Base
    default from: "do-not-reply@bassprofishingtour.com"

    layout 'mailer_layout'

    def sign_up_and_team_up( invitee_email, current_user, request_url )
        @requester = current_user
        @request_url = request_url
        mail(to: invitee_email, subject: "#{@requester.full_name} wants to go fishing!")
    end

    def thanks(email)
        mail(to: email, subject: 'Thanks for registering!')
    end

    def team_created(emails)
        mail(to: emails, subject: 'Introducing the newest team on the tour')
    end
end
