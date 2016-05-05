class Contract < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :studio
end
