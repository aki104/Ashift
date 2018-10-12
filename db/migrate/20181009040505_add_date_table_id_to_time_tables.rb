class AddDateTableIdToTimeTables < ActiveRecord::Migration[5.2]
  def change
    add_column :time_tables, :date_table_id, :integer
  end
end
