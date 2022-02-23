class EmployeeDepartment < ApplicationRecord
    belongs_to :employee
    belongs_to :department 
    
    # validations
    validates_presence_of :department_id, :employee_id
end
