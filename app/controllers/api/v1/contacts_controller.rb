class Api::V1::ContactsController < ApplicationController
	respond_to :json
	before_action :set_contact, only: [:show]

	def show 
		begin
			respond_with @contact
		rescue
			head 200
		end
	end
	
	private
		def set_contact
			@contact = Contact.find(params[:id])
		end
end
