class DateTable < ApplicationRecord

	has_many :time_tables, dependent: :destroy
	belongs_to :employee
	accepts_nested_attributes_for :time_tables, allow_destroy: true

	validates :date, presence: true
	# validates :first_time, numericality: { only_integer: true, less_than_or_equal_to: :first_timex }
    # validates :first_timex, numericality: { only_integer: true, greater_than_or_equal_to: :first_time }
end
