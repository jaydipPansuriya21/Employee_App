class RemoveEmployeeIdFromDepartment < ActiveRecord::Migration[7.0]
  def change
    remove_column :departments, :employee_id
  end
end
