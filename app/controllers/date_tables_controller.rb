class DateTablesController < ApplicationController
  def new
  	@date_table = DateTable.new
  	 15.times { @date_table.time_tables.build }

  end

  def create
  	# binding.pry
  	# puts date_table_params
  	date_table = DateTable.new(date_table_params)
    date_table.employee_id = current_employee.id
    # binding.pry

  	date_table.save
  	redirect_to new_date_table_path(current_employee.id)
  end

  def edit
    # @date_table = DateTable.find(params[:id])
    #  15.times { @date_table.time_tables.build }
  end

  def update
    # date_table = DateTable.find(params[:id])
    # date_table.employee_id = current_employee.id
    # # binding.pry

    # date_table.update(date_table_params)
    # redirect_to edit_date_table_path(current_employee.id)
  end

end

private

  def date_table_params
    params.require(:date_table).permit(:id, :date, :employee_id, time_tables_attributes: [:date_table_id, :date, :id, :first_time, :first_timex, :last_time, :last_timex, :_destroy ])
  end
