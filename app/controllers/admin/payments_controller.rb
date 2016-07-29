class Admin::PaymentsController < Admin::BaseController
	def index
		@studios = Studio.includes(enrollments: [:course, :options])
	end
end
