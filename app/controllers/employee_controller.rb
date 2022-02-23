class EmployeeController < ApplicationController
  def index
    @employees = get_all_employees
  end

  def edit_department
    employee_id = params[:employee_id]
    if employee_id.present?
      begin
        @employee = get_employee_with_give_id(employee_id)
        @departments = get_all_departments
      rescue Exception::EmployeeNotFound => e
        e.message
        # redirect back to original page and give notice that employee is not found.
      end 
      
    end  
  end

  def update_department
    employee_id = params[:employee_id]
    if employee_id.present?
      begin
        @employee = get_employee_with_give_id(employee_id)
        @employee.update_department(params[:department_id])
        @employee.save
        # return success notice    
      rescue Exception::DepartmentNotFound, Exception::EmployeeNotFound => e
        e.message
        # return Error notice that department is not found        
      end

    end  
  end


  private 

  def get_all_employees
    # Eager loading of department data to avoid N+1 query
    Employee.includes(:department)
  end

  def get_employee_with_give_id(employee_id)
    # Return  employee with given id
    # find_by used inisted of find to avoid ActiveRecord::RecordNotFound exception
    employee = Employee.find_by(id: employee_id)
    if employee.nil?
      raise Exceptions::EmployeeNotFound.new, "Employee with given ID #{employee_id} Not found."
    end
    employee
  end

  def get_all_departments
    # Return all departments information
    Department.all
  end
end
