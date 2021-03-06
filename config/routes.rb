require 'api_version_constraint'
Rails.application.routes.draw do
	namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: "/" do
		namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1, default: true) do
			resources :contacts, only: [:index, :show, :create, :update, :destroy]
		end
	end
end
