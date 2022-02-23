class AddEmployeeIdToDepartment < ActiveRecord::Migration[7.0]
  def change
    add_column :departments, :employee_id, :integer
  end
end
