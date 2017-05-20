class CreateContacts < ActiveRecord::Migration[5.1]
	def change
		create_table :contacts do |table_contact|
			table_contact.string :name
			table_contact.string :email
			# table.references :kind, foreign_key: true

			table_contact.timestamps
		end
	end
end