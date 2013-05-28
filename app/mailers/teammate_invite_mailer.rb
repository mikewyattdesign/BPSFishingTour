class TeammateInviteMailer < ActionMailer::Base
  default from: "from@example.com"

  def sign_up_and_team_up(ifirst_name, last_name, email, current_user)
    @requester = current_user
    puts current_user.profile.first_name
    mail(to: email, subject: "#{@requester.full_name} wants to go fishing!")
  end
end
