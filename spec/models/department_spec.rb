require 'rails_helper'

RSpec.describe Department, type: :model do
    context "validations" do
        let!(:department) do Department.new(
                name: "HR",
            ) 
        end
        it 'can not valid without name' do
            department.name = ""
            expect(department).not_to be_valid 
        end
    end
end