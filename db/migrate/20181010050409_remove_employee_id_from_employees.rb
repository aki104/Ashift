class RemoveEmployeeIdFromEmployees < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :employee_id, :integer
  end
end
