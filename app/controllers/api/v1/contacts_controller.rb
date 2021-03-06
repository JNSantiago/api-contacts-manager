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

	def create
		contact = Contact.new(contact_params)

		if contact.save
			render json: contact, status: 201
		else
			render json: { errors: contact.errors }, status: 422
		end
	end

	def update
		contact = Contact.find(params[:id])

		if contact.update(contact_params)
			render json: contact, status: 201
		else
			render json: { errors: contact.errors }, status: 422
		end
	end

	def destroy
		contact = Contact.find(params[:id])
		contact.destroy

		head 204
	end

	private
		def contact_params
			params.require(:contact).permit(:name, :email)
		end
end
