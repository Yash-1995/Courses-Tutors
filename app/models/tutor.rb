class Tutor < ApplicationRecord
	validates :name, presence: true
	belongs_to :course, optional: true
end
