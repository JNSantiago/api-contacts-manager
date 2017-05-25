require 'rails_helper'

RSpec.describe Kind, type: :model do
	before { @kind = FactoryGirl.build(:kind) }

	it { expect(@kind).to validate_presence_of(:description) }
end