class FetchCheckoutService
	def initialize
		@base_url = "http://localhost:3000/"
	end

	def get_checkouts
		uri = URI.parse(@base_url + '/checkouts')
		@response = Net::HTTP.post_form(uri)
		parse_response
	end

	private
	def parse_response
		JSON.parse(@response)['data']
	end
end