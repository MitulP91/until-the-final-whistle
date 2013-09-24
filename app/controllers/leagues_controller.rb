class LeaguesController < ApplicationController
	def index
		@leagues = League.all
	end

	def new
		@league = League.new
	end

	def create
		League.create(params[:league])
		redirect_to root_path
	end

	def show
		@league = League.find(params[:id])
	end

	def edit
		@league = League.find(params[:id])
	end

	def update
		league = League.find(params[:id])
		league.update_attributes(params[:league])

		redirect_to root_path
	end
end
