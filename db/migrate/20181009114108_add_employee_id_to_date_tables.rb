class AddEmployeeIdToDateTables < ActiveRecord::Migration[5.2]
  def change
    add_column :date_tables, :employee_id, :integer
  end
end
