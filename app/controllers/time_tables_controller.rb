class TimeTablesController < ApplicationController
  def new
      @time = TimeTable.new
  end

  def create
      time = TimeTable.new(time_table_params)
      time.save
  end

  def index
  end

  def edit
    # @time = TimeTable.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def time_table_params
    params.require(:time_table).permit(:first_time, :last_time, :employee_id)
  end

end
