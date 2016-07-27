class Term < ActiveRecord::Base
	validates :content, presence: true
end
