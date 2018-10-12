class CreateDateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :date_tables do |t|
      t.date :date

      t.timestamps
    end
  end
end
