require 'rails_helper'

RSpec.describe Contact, type: :model do
	before { @address = FactoryGirl.build(:address) }
	
	it { expect(@address).to validate_presence_of(:street) }
	it { expect(@address).to validate_presence_of(:city) }
end