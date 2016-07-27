class Admin::TermsController < Admin::BaseController
	def index
		@terms = Term.all.page(params[:page])
	end

	def show
		@term = Term.find(params[:id])
	end

	def new
		@term = Term.new
	end

	def create
		@term = Term.new(term_params)
		if @term.save
			set_flash_message :success, :created
			redirect_to admin_terms_path
		else
			set_flash_message :error, :error, scope: :error, now: true
      render :new
		end
	end

	def edit
		@term = Term.find(params[:id])
	end

	def update
		@term = Term.find(params[:id])
		if @term.update_attributes(term_params)
			set_flash_message :success, :created
			redirect_to admin_terms_path
		else
			set_flash_message :error, :error, scope: :error, now: true
      render :new
		end
	end

	def destroy
		@term = Term.find(params[:id])
    if @term.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :error, :destroy_failed
    end
    redirect_to :back
	end

	private
		def term_params
			params.require(:term).permit(:title, :content)
		end
end
