class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def create
  end

  def show
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
