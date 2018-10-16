class AddLastTimexToTimeTables < ActiveRecord::Migration[5.2]
  def change
    add_column :time_tables, :last_timex, :integer, default: 100, null: false
  end
end
