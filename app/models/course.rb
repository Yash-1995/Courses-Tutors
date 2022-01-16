class Course < ApplicationRecord
	validates :name, :description, presence: true
	validates :name, uniqueness: true

	has_many :tutors
end
