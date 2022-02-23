class Employee < ApplicationRecord
    has_one :employee_department
    has_one :department, through: :employee_department

    # validations
    validates_presence_of :first_name, :last_name, :email_address, :phone, :salary
    validates :email_address, uniqueness: { case_sensitive: false }, format: { with: ConstantData::VALID_EMAIL_REGEX }
    validates :phone, uniqueness: true, length: { is: 10 }
    validates :salary, numericality: { only_integer: true} 
    
        
    
    
    def update_department(department_name)
        # update department
        new_department = Department.find_by(name: department_name)
        if new_department.nil?
            raise Exceptions::DepartmentNotFound.new, "Department with given Name #{department_name} Not found."
        end
        self.department = new_department
    end
end
