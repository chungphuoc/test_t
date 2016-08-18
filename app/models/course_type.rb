class CourseType < ActiveRecord::Base
	before_destroy :has_courses

	belongs_to :studio
	has_many :courses
	validates :name, presence: true
	validates_uniqueness_of :name, scope: :studio_id

	def has_courses
		if courses.exists?
			errors.add(:course_type, ": You need to delete courses involved")
			return false
		end
		return true
	end
end
