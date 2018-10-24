class ManningsController < ApplicationController
  def show
  	@employees = Employee.all
  	@time_tables = TimeTable.where(date: Date.new(2018,11,params[:id].to_i)).where.not(first_time: 100)

  end

  def update
  end

  private

  def manning_params
    params.require(:manning).permit(:id, :date_table_id, :time_table_id, :date)
  end
end
