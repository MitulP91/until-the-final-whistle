# encoding: utf-8

class PlayersController < ApplicationController
	require 'nokogiri'
	require 'open-uri'

	def new
		@team = Team.find(params[:team_id])
		@player = Player.new
	end

	def create
		team = Team.find(params[:team_id])
		player = Player.create(params[:player])
		team.players << player

		redirect_to team_path(params[:team_id])
	end

	def show
		@player = Player.find(params[:id])
		# encoding: utf-8
		doc = Nokogiri::HTML(open("http://www.bing.com/images/search?q=#{@player.name.gsub(/\s/, '+')}+#{@player.team.name.gsub(/\s/, '+')}"))
		@pic = doc.css('.imgres:first-child a img')[0].attributes['src2'].value
	end

	def edit
		@team = Team.find(params[:team_id])
		@player = Player.find(params[:id])
	end

	def update
		player = Player.find(params[:id])

		player.update_attributes(params[:player])

		redirect_to team_path(params[:team_id])
	end
end
