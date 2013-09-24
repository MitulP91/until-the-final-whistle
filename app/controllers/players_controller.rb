class PlayersController < ApplicationController
	def new
		@team_id = params[:team_id]
		@player = Player.new
	end

	def create
		team = Team.find(params[:team_id])
		player = Player.new(params[:player])
		team.players << player

		redirect_to team_players_path
	end

	def show
		@player = Player.find(params[:id])
	end

	def edit
		@team_id = params[:team_id]
		@player = Player.find(params[:id])
	end

	def update
		player = Player.find(params[:id])

		player.update_attributes(params[:player])

		redirect_to team_path(params[:team_id])
	end
end
