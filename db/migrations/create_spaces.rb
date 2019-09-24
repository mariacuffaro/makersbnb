class CreateSpace < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |table|
      table.string :name, :null => false
      table.string :description, :null => false
      table.string :price, :null => false
      table.date :available_from, :date => false
      table.date :available_to, :null => false
    end
  end
end
