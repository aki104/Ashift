class EmployeesController < ApplicationController
  protect_from_forgery :except => [:sort]

  def index
    @employees = Employee.rank(:row_order)
  end

  # this action will be called via ajax
  def sort
      employee = Employee.find(params[:employee_id])

      employee.update(employee_params)
      @employees = Employee.rank(:row_order)
      @date_tables = DateTable.all

@a = []
@p = []
i = 0
        @employees.each do |employee|
          @a[i]=0
          @p[i]=0
            date = DateTable.find_by(employee_id: employee.id, date: Date.new(Date.today.year.to_i,Date.today.month.to_i + 1))
                 unless date == nil
            @time = TimeTable.where(date_table_id: date.id)
            @time_tables = TimeTable.where(date_table_id: date.id, date: Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,1)..Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,15))



               @time.each do |t|
                 @working_time = 0   # 労働時間
            @over_time = 0   # 残業時間
          # ここから労働時間を出すための計算
                   @all_working_time = t.first_timex - t.first_time
                   @lt = t.last_timex -  t.last_time

                     if @lt == 30
                        @all_working_time += 0.5

                     elsif @lt == -30
                        @all_working_time -= 0.5
                     end

                   @working_time += @all_working_time
                   @a[i] += @working_time
          #ここまで労働時間を出すための計算
          #ここから残業時間を出すための計算
                   @all_over_time = @all_working_time - 8

                     if @all_over_time >= 0
                        @over_time += @all_over_time
                     end
                     @p[i] += @over_time

                end
            end
                i+=1
        end

      render "time_tables/index"
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
  end

  def destroy
     employee = Employee.find(params[:id])
        employee.destroy
        redirect_to time_tables_path
  end

private

 # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:employee).permit(:id, :first_time, :first_timex, :last_time, :last_timex, :employee_id, :date, :row_order_position)
  end



end
