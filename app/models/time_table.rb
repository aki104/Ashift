class TimeTable < ApplicationRecord

	belongs_to :date_table
	has_many :mannings


	validates :date, presence: true
	 validates :first_time, numericality: { only_integer: true, less_than_or_equal_to: :first_timex }
     validates :first_timex, numericality: { only_integer: true, greater_than_or_equal_to: :first_time }
#      validates_numericality_of :first_timex, greater_than_or_equal_to: "first_time".to_i
#      validates_numericality_of :first_time, greater_than_or_equal_to: "first_timex".to_i
 end
