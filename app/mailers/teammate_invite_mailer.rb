class TeammateInviteMailer < ActionMailer::Base
  default from: "from@example.com"

  def sign_up_and_team_up(first_name, last_name, email)
    requester = "#{@requester.profile.first_name} #{@requester.profile.last_name}" #@requester is nil!! fix
    mail(to: email, subject: "#{requester} wants to go fishing!")
  end
end
