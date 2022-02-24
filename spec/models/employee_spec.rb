require 'rails_helper'

RSpec.describe Employee, type: :model do
    context "validations" do
        let!(:employee) do 
            Employee.new(
                first_name: "Jaydip",
                last_name: "Pansuriya",
                email_address: "Hello@gmail.com",
                phone: 9863254712,
                salary: 2000000 
            ) 
        end
        it 'can not valid without first_name' do
            employee.first_name = ""
            expect(employee).not_to be_valid 
        end
        it 'can not valid without last_name' do
            employee.last_name = ""
            expect(employee).not_to be_valid 
        end
        it 'can not valid without email address' do
            employee.email_address = ""
            expect(employee).not_to be_valid 
        end
        it 'can not valid without phone' do
            employee.phone = ""
            expect(employee).not_to be_valid 
        end
        it 'can not valid without salary' do
            employee.salary = ""
            expect(employee).not_to be_valid 
        end

        it 'can not valid without correct email' do
            employee.email_address = "hello"
            expect(employee).not_to be_valid 
        end

        it 'Phone number length must equal to 10' do
            expect(employee).to be_valid # having phone number length = 10 
            
            employee.phone = "99865" # length = 5
            expect(employee).not_to be_valid
            
            employee.phone = "99865258741"  # length = 11
            expect(employee).not_to be_valid
        end

        it 'salary must be numeric' do
            employee.salary = "1200000"
            expect(employee).to be_valid
            
            employee.salary = 1200000    
            expect(employee).to be_valid

            employee.salary = "1200a000"    
            expect(employee).not_to be_valid                
        end
    end
end