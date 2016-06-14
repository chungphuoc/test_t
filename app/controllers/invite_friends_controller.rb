class InviteFriendsController < ApplicationController
  before_action :authenticate_user!
  def send_email
    if params[:message] && params[:email]
      InviteFriendMailer.to_friend(current_user, params[:message], params[:email]).deliver_later
      set_flash_message :success, :sent
    else
      set_flash_message :error, :error
    end
    redirect_to :back
  end
end
