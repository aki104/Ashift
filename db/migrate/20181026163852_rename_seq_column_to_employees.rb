class RenameSeqColumnToEmployees < ActiveRecord::Migration[5.2]
  def change
  	rename_column :employees, :seq, :row_order
  end
end
