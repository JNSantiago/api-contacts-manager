require "rails_helper"

RSpec.describe "Contacts API", type: :request do
	let!(:contact) { create(:contact) }
	let(:contact_id) { contact.id }

	before { host! "api.contactsmanager.dev" }

	describe "GET /contacts/:id" do

		before do
			headers = { "Accept" => "application/vnd.contactsmanager.v1" }
			get "/contacts/#{contact_id}", params: {}, headers: headers
		end

		context "When contact exists in database do" do
			it "When return contact" do
				contact_response = JSON.parse(response.body)
				expect(contact_response["id"]).to eq(contact_id)
			end
			it "When return status code" do
				expect(response).to have_http_status(200)
			end
		end
	end
end