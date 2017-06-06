class CreateAddress < ActiveRecord::Migration[5.1]
	def change
		create_table :addresses do |table_address|
			table_address.string :street
			table_address.integer :number
			table_address.string :city
			table_address.string :state
		end
	end
end