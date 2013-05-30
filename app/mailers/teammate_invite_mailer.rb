class TeammateInviteMailer < ActionMailer::Base
  default from: "from@example.com"

  def sign_up_and_team_up( invitee_email, current_user, request_url )
    @requester = current_user
    @request_url = request_url
    mail(to: invitee_email, subject: "#{@requester.full_name} wants to go fishing!")
  end
end
