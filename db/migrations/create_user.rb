class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |table|
      table.string :first_name, :null => false
      table.string :last_name, :null => false
      table.string :email, :null => false, unique: true
      table.string :password, :null => false  
    end
  end
end
