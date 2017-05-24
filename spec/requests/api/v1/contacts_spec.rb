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

		context "When contact does not exists in database" do
			let(:contact_id) { 1000 }

			it "When contact does not exists" do
				expect(response).to have_http_status(404)
			end
		end
	end

	describe "GET /contacts" do

		before do
			headers = { "Accept" => "application/vnd.contactsmanager.v1" }
			get "/contacts", params: {}, headers: headers
		end

		context "When exists contacts in database" do
			it "When contacts exists" do
				contact_response = JSON.parse(response.body)
				expect(contact_response).not_to be_empty
			end
			it "When return status code" do
				expect(response).to have_http_status(200)
			end
		end
	end

	describe "POST /contacts" do
		before do
			headers = { "Accept" => "application/vnd.contactsmanager.v1" }
			post '/contacts', params: { contact: contact_params }, headers: headers
		end

		context "When this parameters is valid" do
			let(:contact_params) { FactoryGirl.attributes_for(:contact) }

			it "return 201 status code" do
				expect(response).to have_http_status(201)
			end

			it "return json for contact" do
				contact_response = JSON.parse(response.body)
				expect(contact_response["name"]).to eq(contact_params[:name])
			end
		end

		context "When this parameters are invalids" do
			let(:contact_params) { attributes_for(:contact, name: '') }	

			it 'When return 422 status code' do
				expect(response).to have_http_status(422)
			end		
			it 'When return json error for contact' do
				contact_response = JSON.parse(response.body)
				expect(contact_response).to have_key('errors')
			end
		end
	end
end