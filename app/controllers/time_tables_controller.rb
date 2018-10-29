class TimeTablesController < ApplicationController
      protect_from_forgery :except => [:update]
      # protect_from_forgery :except => [:create]

  def index_l
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
            @time_tables = TimeTable.where(date_table_id: date.id, date: Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,16)..Date.new(Date.today.year.to_i,Date.today.month.to_i + 1).end_of_month)

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
                        @p[i] += @over_time
                     end
                end
            end
            i += 1
        end
  end

  def index
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
  end

   # this action will be called via ajax
  def sort
      employee = Employee.find(params[:employee_id])
      employee.update(employee_params)
      render nothing: true
  end

  def edit
       @time_table = TimeTable.find(params[:id])
  end

  def update
      @time_table = TimeTable.find(params[:id])
      puts  params[:time_table][:first_time]
      # binding.pry
      params[:time_table][:date] = Date.parse(params[:time_table][:date])

      if  params[:time_table][:first_time].to_i == 100
          @time_table.update(first_time: 100, first_timex: 100, last_time: 100, last_timex: 100)

          if  Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,1) <= params[:time_table][:date] && params[:time_table][:date] <= Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,15)
             redirect_to time_tables_path, notice: '時間を編集しました'
          elsif Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,16) <= params[:time_table][:date] && params[:time_table][:date] <= Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,).end_of_month
             redirect_to time_tables_l_path
          end

      else

          if @time_table.update(time_table_params)
              if Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,1) <= params[:time_table][:date] && params[:time_table][:date] <= Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,15)
                 redirect_to time_tables_path, notice: '時間を編集しました'


              elsif Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,16) <= params[:time_table][:date] && params[:time_table][:date] <= Date.new(Date.today.year.to_i,Date.today.month.to_i + 1,).end_of_month
                 redirect_to time_tables_l_path
              end
          else
              render "edit"
          end
      end
  end

  def manning_edit
      @time_table = TimeTable.find(params[:id])
      @time_table_a = TimeTable.find_by(date: params[:date], id: params[:id])
  end

  def manning_edit_up
      @time_table = TimeTable.find(params[:id])
      # binding.pry
    if  params[:time_table][:first_time].to_i == 100
        @time_table.update(first_time: 100, first_timex: 100, last_time: 100, last_timex: 100)
        redirect_to manning_path(@time_table.date.day)
    else

         if @time_table.update(time_table_params)
            redirect_to manning_path(@time_table.date.day)
         else
            render "manning_show"
         end
    end
  end

  def destroy
  end

  private

 # Never trust parameters from the scary internet, only allow the white list through.
  def time_table_params
    params.require(:time_table).permit(:id, :first_time, :first_timex, :last_time, :last_timex, :employee_id, :date, :row_order_position)
  end

end
