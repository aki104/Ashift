class TopsController < ApplicationController
  def top
  	@employee = current_employee
  end
end
