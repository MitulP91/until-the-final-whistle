class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_teams

  # Method to allow all teams to be accessed anywhere
  def current_teams
  	Team.order("name ASC").all
  end
end
