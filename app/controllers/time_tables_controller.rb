class TimeTablesController < ApplicationController
      protect_from_forgery :except => [:update]

  def index_l
      @time_tables = TimeTable
      @employees = Employee.all
      @date_tables = DateTable.all
@a = []
@p = []
i = 0

        @employees.each do |employee|
          @a[i]=0
          @p[i]=0
            date = DateTable.find_by(employee_id: employee.id, date: "2018-11-01")
                 unless date == nil
            time = TimeTable.where(date_table_id: date.id)

               time.each do |t|

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

  def create

  end

  def index
      @time_tables = TimeTable.where(date: "2018-11-01".."2018-11-15")
      @employees = Employee.all
      @date_tables = DateTable.all

@a = []
@p = []
i = 0
        @employees.each do |employee|
          @a[i]=0
          @p[i]=0
            date = DateTable.find_by(employee_id: employee.id, date: "2018-11-01")
                 unless date == nil
            @time = TimeTable.where(date_table_id: date.id)



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

          if  Date.new(2018,11,01) <= params[:time_table][:date] && params[:time_table][:date] <= Date.new(2018,11,15)
             redirect_to time_tables_path, notice: '時間を編集しました'
          elsif Date.new(2018,11,16) <= params[:time_table][:date] && params[:time_table][:date] <= Date.new(2018,11,30)
             redirect_to time_tables_l_path
          end

      else

          if @time_table.update(time_table_params)
              if Date.new(2018,11,01) <= params[:time_table][:date] && params[:time_table][:date] <= Date.new(2018,11,15)
                 redirect_to time_tables_path, notice: '時間を編集しました'


              elsif Date.new(2018,11,16) <= params[:time_table][:date] && params[:time_table][:date] <= Date.new(2018,11,30)
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

  def time_table_params
    params.require(:time_table).permit(:id, :first_time, :first_timex, :last_time, :last_timex, :employee_id, :date)
  end

end
