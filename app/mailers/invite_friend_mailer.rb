class InviteFriendMailer < ActionMailer::Base
  default from: 'admin@tone.com'

  def to_friend(user, friend_name, friend_mail)
    @user = user
    @friend_mail = friend_mail
    @friend_name = friend_name
    subject = 'Invitation to Tone'
    mail(to: friend_mail, subject: subject, template_name: 'to_friend')
  end
end
