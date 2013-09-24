class TeamsController < ApplicationController
	require 'HTTParty'

	def index
		@teams = Team.all
	end

	def new
		@team = Team.new
	end

	def create
		Team.create(params[:team])

		redirect_to teams_path
	end

	def show
		@team = Team.find(params[:id])
		query = @team.name

		url = "https://news.google.com/news/feeds?q=#{query.downcase.gsub(/\s/, '+')}&output=rss"
		response = HTTParty.get(url)
		data = response.parsed_response
		@articles = data["rss"]["channel"]["item"]

		url2 = "http://api.statsfc.com/premier-league/fixtures.json?key=DThzCPsM_TI0XUGeUOJqr26JHwtYXVIfYvSSb0ui&team=#{query.downcase.gsub(/\s/, '+')}&timezone=America/New_York&limit=5"
		response2 = HTTParty.get(url2)
		@data2 = response2.parsed_response
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		team = Team.find(params[:id])
		team.update_attributes(params[:team])

		redirect_to teams_path
	end
end
