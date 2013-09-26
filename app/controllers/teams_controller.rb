class TeamsController < ApplicationController
	# Includes module to make HTTParty methods DRY
	include PartyTime

	# Also the root page.
	def index
		@teams = Team.order("name ASC").all

		# Pulls upcoming fixtures in Premier League
		@data = party_time("http://api.statsfc.com/premier-league/fixtures.json?key=DThzCPsM_TI0XUGeUOJqr26JHwtYXVIfYvSSb0ui&timezone=America/New_York&limit=10")

		# Pulls top scorers in Premier League
		@data2 = party_time("http://api.statsfc.com/top-scorers.json?key=DThzCPsM_TI0XUGeUOJqr26JHwtYXVIfYvSSb0ui&competition=premier-league&year=2013/2014&limit=10")	

		# Pulls news articles about the league through Google RSS
		data = party_time("https://news.google.com/news/feeds?q=barclays+premier+league&output=rss")
		@articles = data["rss"]["channel"]["item"]
	end

	# Creates new team (admin only)
	def new
		@team = Team.new
	end

	# Posts new team (admin only)
	def create
		Team.create(params[:team])

		redirect_to teams_path
	end

	# Displays each individual team with players and other stats
	def show
		@team = Team.find(params[:id])
		query = @team.name

		# Pulls news articles about each team through Google RSS
		data = party_time("https://news.google.com/news/feeds?q=#{query.downcase.gsub(/\s/, '+')}&output=rss")
		@articles = data["rss"]["channel"]["item"]

		# Pulls upcoming fixtures for this team
		@data2 = party_time("http://api.statsfc.com/premier-league/fixtures.json?key=DThzCPsM_TI0XUGeUOJqr26JHwtYXVIfYvSSb0ui&team=#{query.downcase.gsub(/\s/, '-')}&timezone=America/New_York&limit=5")

		# Pulls past results for this team 
		@data3 = party_time("http://api.statsfc.com/premier-league/results.json?key=DThzCPsM_TI0XUGeUOJqr26JHwtYXVIfYvSSb0ui&team=#{query.downcase.gsub(/\s/, '-')}&timezone=America/New_York&limit=5")
	end

	# Edit team (admin only)
	def edit
		@team = Team.find(params[:id])
	end

	# Post edited team (admin only)
	def update
		team = Team.find(params[:id])
		team.update_attributes(params[:team])

		redirect_to teams_path
	end

	def favorites
		@user = current_user
	end

	def favorites_create
		team = Team.find(params[:team_id])
		current_user.teams << team

		redirect_to team_path(team)
	end
end
