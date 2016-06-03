class Admin::BranchesController < Admin::BaseController
  before_action :prepare_studio

  def index
    @branches = @studio.branches
  end

  def create
    @branch = @studio.branches.new(station_id: params[:branch][:station_id])
    if @branch.save
      set_flash_message :success, :created
    else
      flash[:error] = @branch.errors[:station_id].to_sentence
    end
    redirect_to :back
  end

  def destroy
    @branch = Branch.find(params[:id])
    if @branch.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :error, :destroy_failed
    end
    redirect_to :back
  end

  private

  def prepare_studio
    @studio = Studio.find(params[:studio_id])
  end
end
