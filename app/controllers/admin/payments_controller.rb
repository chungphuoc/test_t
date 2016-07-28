class Admin::PaymentsController < Admin::BaseController
	def index
		@studios = Studio.all
	end
end
