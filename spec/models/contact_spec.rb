require 'rails_helper'

RSpec.describe Contact, type: :model do
	before { @contact = FactoryGirl.build(:contact) }
	
	it { expect(@contact).to validate_presence_of(:name) }
	it { expect(@contact).to validate_presence_of(:email) }
end