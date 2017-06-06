# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Kind.create(description: 'Amigo')
Kind.create(description: 'Empresa')
Kind.create(description: 'Familia')

10.times do 
	Contact.create(name: Faker::Name.name,
					email: Faker::Internet.email)
end