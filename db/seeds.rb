# Include necessary gems
require 'nokogiri'
require 'open-uri'
include Nokogiri
include PartyTime

# Delete all data on seed
Player.delete_all
Team.delete_all
League.delete_all

# Pull all Premier League teams from API
data = party_time("http://api.statsfc.com/premier-league/table.json?key=DThzCPsM_TI0XUGeUOJqr26JHwtYXVIfYvSSb0ui&year=2013/2014")

lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus, nulla reprehenderit impedit quis iusto dolores suscipit molestias id quo quia minus explicabo excepturi. Et, tempora similique molestiae minus vero consequatur!"
# Create League
league = League.create(name: "Barclays Premier League", country: "England")

# Filter through data pulled from API
data.each do |some_team|
	# Create all teams and insert them into Barclays Premier League
	team = Team.create(name: some_team["team"], current_place: some_team["position"])
	league.teams << team

	# Use Nokogiri to pull squad data from premierleague.com
	doc = Nokogiri::HTML(open("http://www.premierleague.com/en-gb/clubs/profile.squads.html/#{some_team['teamshort'].downcase.gsub(/\s/, '-')}"))
	players = doc.css('.player-squadno a')
	positions = doc.css('.player-position')

	# Defaults i to 0
	i = 0

	# Pulls one players name and position at the same time
	while i < players.count do
		# Inserts player data into their team
		team.players << Player.create(name: players[i].children().inner_text, position: positions[i].children().inner_text, bio: lorem)
		i += 1
	end
end

