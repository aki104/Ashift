class TimeTable < ApplicationRecord

	belongs_to :date_table
	has_many :mannings


	validates :date, presence: true

end
