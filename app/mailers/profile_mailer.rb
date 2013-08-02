class ProfileMailer < ActionMailer::Base
    default from: "do-not-reply@bassprofishingtour.com"

    layout 'mailer_layout'

    def completion_reminder(email)
        mail(to: email, subject: 'Important Bass Pro Fishing Tour Reminder')
    end
end
