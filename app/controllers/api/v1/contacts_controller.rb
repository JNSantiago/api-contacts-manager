class Api::V1::ContactsController < ApplicationController
	respond_to :json

	def index
		@contacts = Contact.all
		respond_with @contacts
	end

	def show 
		begin
			@contact = Contact.find(params[:id])
			respond_with @contact
		rescue
			head 404
		end
	end	
end
