class CreateTimeTables < ActiveRecord::Migration[5.2]
  def change
    create_table :time_tables do |t|
      t.integer :employee_id
      t.date :date
      t.integer :first_time, default: 100, null: false
      t.integer :last_time, default: 100, null: false

      t.timestamps
    end
  end
end
