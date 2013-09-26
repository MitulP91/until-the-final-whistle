class LeaguesController < ApplicationController

	def index
		@leagues = League.all
	end

	# Creates new league (admin only)
	def new
		@league = League.new
	end

	# Posts new league (admin only)
	def create
		League.create(params[:league])
		redirect_to root_path
	end

	# Shows specific league info
	def show
		@league = League.find(params[:id])
	end

	# Edit league (admin only)
	def edit
		@league = League.find(params[:id])
	end

	# Post edited league (admin only)
	def update
		league = League.find(params[:id])
		league.update_attributes(params[:league])

		redirect_to root_path
	end
end
