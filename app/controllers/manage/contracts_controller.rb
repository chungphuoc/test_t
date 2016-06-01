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
      set_flash_message :success, :added
      redirect_to manage_contracts_url
    else
      set_flash_message :error, :error, now: true, scope: :error
      render :new
    end
  end

  def edit
  end

  def update
    if @contract.update_attributes(contract_params)
      set_flash_message :success, :updated
      redirect_to manage_contracts_url
    else
      set_flash_message :error, :error, now: true, scope: :error
      render :edit
    end
  end

  def destroy
    @contract.destroy
    set_flash_message :success, :removed
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
