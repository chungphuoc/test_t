class Admin::BranchesController < Admin::BaseController
  before_action :prepare_studio

  def index
    @branches = @studio.branches
  end

  def create
    @branch = @studio.branches.new(station_id: params[:branch][:station_id])
    if @branch.save
      flash[:success] = 'Add Station successful!'
    else
      flash[:error] = @branch.errors[:station_id].to_sentence
    end
    redirect_to :back
  end

  def destroy
    @branch = Branch.find(params[:id])
    if @branch.destroy
      flash[:success] = 'Delete station successful!'
    else
      flash[:error] = 'Can not delete station!'
    end
    redirect_to :back
  end

  private

  def prepare_studio
    @studio = Studio.find(params[:studio_id])
  end

end
