module PartyTime
	require 'httparty'

	def party_time(url)
		link = url
		response = HTTParty.get(link)
		data = response.parsed_response
		return data
	end
end