class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :phone
      t.integer :salary

      t.timestamps
    end
  end
end
