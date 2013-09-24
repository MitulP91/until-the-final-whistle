# Include necessary gems
require 'httparty'
require 'nokogiri'
require 'open-uri'
include Nokogiri

# Create default league 
League.create(name: "Barclays Premier League", country: "England")

# Delete all data on seed
Player.delete_all
Team.delete_all
League.delete_all

# Access API and pull wanted data
url = "http://api.statsfc.com/premier-league/table.json?key=DThzCPsM_TI0XUGeUOJqr26JHwtYXVIfYvSSb0ui&year=2013/2014"
response = HTTParty.get(url)
data = response.parsed_response

# Create League
league = League.create(name: "Barclays Premier League", country: "England")

# Create all teams from the Barclays Premier League
data.each do |some_team|
	team = Team.create(league_id: 1, name: some_team["team"], current_place: some_team["position"])
	league.teams << team
	# Use Nokogiri to pull squad data from premierleague.com
	doc = Nokogiri::HTML(open("http://www.premierleague.com/en-gb/clubs/profile.squads.html/#{some_team['teamshort'].downcase.gsub(/\s/, '-')}"))
	players = doc.css('.player-squadno a')
	positions = doc.css('.player-position')

	i = 0
	while i < players.count do
		team.players << Player.create(name: players[i].children().inner_text, position: positions[i].children().inner_text)
		i += 1
	end
end

