class DateTablesController < ApplicationController
    def edit
    # TimeTble.find_by()
     @date_table = DateTable.find_by(id: params[:id], employee_id: current_employee.id)
     puts @date_table
  end

  def new
  	@date_table = DateTable.new
  	 30.times { @date_table.time_tables.build }

  end

  def create
  	@date_table = DateTable.new(date_table_params)
    @date_table.employee_id = current_employee.id
   # binding.pry
  	   if @date_table.save
          redirect_to edit_date_table_path(@date_table.id)
       else
        puts @date_table.errors.full_messages
          render 'new'
       end
       # binding.pry
  end



  def update
     date_table = DateTable.find(params[:id])
     date_table.employee_id = current_employee.id
     date_table.update(date_table_params)
      redirect_to edit_date_table_path(current_employee.id)
     # binding.pry

     date_table.update(date_table_params)
    # redirect_to edit_date_table_path(current_employee.id)


end

private

  def date_table_params
    params.require(:date_table).permit(:id, :date, :employee_id, time_tables_attributes: [:date_table_id, :date, :id, :first_time, :first_timex, :last_time, :last_timex, :_destroy ])
  end
end
