class InviteFriendMailer < ActionMailer::Base
  default from: 'admin@tone.com'

  def to_friend(user, message, friend_mail)
    @user = user
    @friend_mail = friend_mail
    @message = message
    subject = 'Invitation to Tone'
    mail(to: friend_mail, subject: subject, template_name: 'to_friend')
  end
end
