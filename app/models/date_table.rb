class DateTable < ApplicationRecord
    
	has_many :time_tables, dependent: :destroy
	belongs_to :employee
	accepts_nested_attributes_for :time_tables, allow_destroy: true

	validates :date, presence: true
end
