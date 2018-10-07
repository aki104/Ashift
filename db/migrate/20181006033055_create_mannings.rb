class CreateMannings < ActiveRecord::Migration[5.2]
  def change
    create_table :mannings do |t|
      t.integer :time_table_id
      t.integer :employee_id
      t.boolean :break_flag, null: false, default: "false"
      t.boolean :meeting_flag, null: false, default: "false"

      t.timestamps
    end
  end
end
