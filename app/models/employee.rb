class Employee < ApplicationRecord
    has_one :employee_department
    has_one :department, through: :employee_department

    # validations
    validates_presence_of :first_name, :last_name, :email, :phone, :salary
    validates :email, uniqueness: { case_sensitive: false }, format: { with: ConstantData::VALID_EMAIL_REGEX }
    validates :phone, uniqueness: true, length: { is: 10 }
    validates :salary, numericality: { only_integer: true} 
    
        
    
    
    def update_department(department_id)
        # update department
        # find_by used inisted of find to avoid ActiveRecord::RecordNotFound exception
        new_department = Department.find_by(id: department_id)
        if new_department.nil?
            raise Exceptions::DepartmentNotFound.new, "Department with given ID #{department_id} Not found."
        end
        self.department = new_department
    end
end
