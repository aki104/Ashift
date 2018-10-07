class CreateWorkContents < ActiveRecord::Migration[5.2]
  def change
    create_table :work_contents do |t|
      t.integer :employee_id
      t.integer :work_id

      t.timestamps
    end
  end
end
