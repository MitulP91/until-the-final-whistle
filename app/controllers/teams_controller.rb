class TeamsController < ApplicationController
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
