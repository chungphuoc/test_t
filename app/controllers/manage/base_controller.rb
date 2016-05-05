class Manage::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :prepare_studio

  private
    def prepare_studio
      @studio = current_user.studio
    end
end
