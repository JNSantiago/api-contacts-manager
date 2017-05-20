class ApiVersionConstraint
	def initialize(options)
		@version = options[:version]
		@default = options[:default]
	end

	def matchers?(req)
		@default || req.headers['Accept'].include?("application/vnd.contactmanager.v#{@version}")
	end
end