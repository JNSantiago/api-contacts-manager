class CreateKinds < ActiveRecord::Migration[5.1]
	def change
		create_table :kinds do |table_kind|
			table_kind.string :description

			table_kind.timestamps
		end
	end
end