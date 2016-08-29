class Manage::BranchesController < Manage::BaseController
  before_action :prepare_branch, only: [:edit, :update]
  def index
    @branches = @studio.branches.includes(station: [:translations])
  end

  def edit
  end

  def update
    @branch.assign_attributes(branch_params)
    if @branch.save
      set_flash_message :success, :updated
      redirect_to manage_branches_path
    else
      set_flash_message :error, :error, now: true, scope: :error
      render :edit
    end
  end

  private

  def prepare_branch
    @branch = Branch.find(params[:id])
  end

  def branch_params
    params.require(:branch).permit(:min_walk)
  end
end
