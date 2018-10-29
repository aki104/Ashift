class AddSeqToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :seq, :integer
  end
end
