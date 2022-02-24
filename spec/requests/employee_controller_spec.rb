require 'rails_helper'

RSpec.describe EmployeeController, type: :request do
    let(:employee) do 
        Employee.new(
            first_name: "Jaydip",
            last_name: "Pansuriya",
            email_address: "Hello@gmail.com",
            phone: 9863254712,
            salary: 2000000 
        )
    end
    # need to create department (other) as it will assign to employee automatic if 
    # no department is provide with employee
    let!(:hr_department) do 
        Department.create(
            name: "HR",
        )     
    end
    let!(:other_department) do 
        Department.create(
            name: "Other",
        )     
    end
    context "Index Method" do
        it "returns http success" do
            get '/'
            expect(response).to have_http_status(:ok)
            expect(subject).to render_template('employee/index')
        end
    end

    context "edit_department Method" do
        it "returns http success" do
            employee.save
            get "/employee/edit_department/#{employee.id}"
            expect(response).to have_http_status(:ok)
            expect(subject).to render_template('employee/edit_department')
        end
    end

    context "update_department Method" do
        let(:params) do
            {
                employee_id: employee.id,
                department_name: hr_department.name
            } 
        end 
        it "It should update department name and redirect to root url" do
            employee.save
            post "/employee/update_department", params: params
            expect(response).to have_http_status(302)
            employee.reload
            expect(employee.department.name).to eq('HR')
        end
        it "when pass department which is not exist it should render error partial" do
            employee.save
            params['department_name'] = 'Hello'
            post "/employee/update_department", params: params
            expect(response).to render_template('layouts/_errors')
        end
    end
end