class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
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
end
