class Manage::ContractsController < Manage::BaseController
  def index
    @contracts = @studio.contracts.includes(:teacher)
  end

  def new
    @contract = Contract.new
    @contract.build_teacher
  end

  def create
    @contract = @studio.contracts.new(contract_params)
    if @contract.save
      flash[:success] = 'Teacher has been successfully added.'
      redirect_to manage_contracts_url
    else
      flash.now[:error] = 'Error!'
      render :new
    end
  end

  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy
    flash[:success] = 'Teacher has been successfully removed.'
    redirect_to manage_contracts_url
  end

  private

  def contract_params
    params.require(:contract).permit(teacher_attributes: [:name])
  end
end
