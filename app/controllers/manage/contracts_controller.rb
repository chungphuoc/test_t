class Manage::ContractsController < Manage::BaseController
  before_action :prepare_contract, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @contract.update_attributes(contract_params)
      flash[:success] = 'Teacher has been successfully updated.'
      redirect_to manage_contracts_url
    else
      flash.now[:error] = 'Error!'
      render :edit
    end
  end

  def destroy
    @contract.destroy
    flash[:success] = 'Teacher has been successfully removed.'
    redirect_to manage_contracts_url
  end

  private

  def prepare_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(teacher_attributes: [:name])
  end
end
