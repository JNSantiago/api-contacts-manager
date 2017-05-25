FactoryGirl.define do
	factory :kind do
		description { Faker::App.name }
	end
end