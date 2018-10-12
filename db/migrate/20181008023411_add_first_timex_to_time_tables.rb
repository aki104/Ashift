class AddFirstTimexToTimeTables < ActiveRecord::Migration[5.2]
  def change
    add_column :time_tables, :first_timex, :integer, default: 100, null: false
  end
end
