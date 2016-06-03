class Admin::ContractsController < Admin::BaseController
  before_action :prepare_studio

  def index
    @contracts = @studio.contracts
  end

  def create
    @teacher = Teacher.new(name: params[:teacher_name])
    if @teacher.save
      @contract = @studio.contracts.new(teacher: @teacher)
      if @contract.save
        set_flash_message :success, :created
        redirect_to admin_studio_contracts_path
      else
        set_flash_message :error, :error, scope: :error
        redirect_to :back
      end
    else
      flash[:error] = 'Teacher name ' + @teacher.errors[:name].to_sentence
      redirect_to :back
    end
  end

  def destroy
    @contract = Contract.find(params[:id])
    @teacher = @contract.teacher
    if @teacher.destroy
      set_flash_message :success, :destroyed
      redirect_to admin_studio_contracts_path
    else
      set_flash_message :error, :destroy_failed
      redirect_to :back
    end
  end

  private

  def prepare_studio
    @studio = Studio.find(params[:studio_id])
  end
end
