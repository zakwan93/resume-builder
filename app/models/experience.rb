class Experience < ApplicationRecord
	belongs_to :resume
	has_many :projects
end
