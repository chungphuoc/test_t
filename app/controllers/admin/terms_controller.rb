class Admin::TermsController < Admin::BaseController
	before_action :check_exist_term_and_condition
	
	def index
		@term = Term.first
	end

	def edit
		@term = Term.first
	end

	def update
		@term = Term.first
		if @term.update_attributes(term_params)
			set_flash_message :success, :created
			redirect_to admin_terms_path
		else
			set_flash_message :error, :error, scope: :error, now: true
      render :new
		end
	end

	private
		def term_params
			params.require(:term).permit(:content)
		end

		def check_exist_term_and_condition
			if Term.count == 0 
				@term = Term.create(content: 'default')
			end
		end
end
