class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |table_phone|
      table_phone.string :number
    end
  end
end
