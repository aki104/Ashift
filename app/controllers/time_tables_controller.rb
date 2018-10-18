class TimeTablesController < ApplicationController
  def show


  end

  def create

      @time_table = params[:taim_table]
      #time_table = params[:group].inspect
        @time_table.each do |time|
        time.save
        end
  end

  def index
      @time_tables = TimeTable.all
      @employees = Employee.all
      @date_tables = DateTable.all
  end

  def edit
       @time_table = TimeTable.find(params[:id])
  end

  def update
      @time_table = TimeTable.find(params[:id])
      puts  params[:time_table][:first_time]
      # binding.pry
    if  params[:time_table][:first_time].to_i == 100
        @time_table.update(first_time: 100, first_timex: 100, last_time: 100, last_timex: 100)
        redirect_to time_tables_path, notice: '時間を編集しました'
    else

         if @time_table.update(time_table_params)
            redirect_to time_tables_path, notice: '時間を編集しました'
         else
            render "edit"
         end
    end
  end

  def destroy
  end

  private

  def time_table_params
    params.require(:time_table).permit(:id, :first_time, :first_timex, :last_time, :last_timex, :employee_id, :date)
  end

end
