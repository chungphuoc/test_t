class InviteFriendsController < ApplicationController
  before_action :authenticate_user!
  def send_email
    InviteFriendMailer.to_friend(current_user, params[:name], params[:email]).deliver_later
    set_flash_message :success, :sent
    redirect_to :back
  end
end
