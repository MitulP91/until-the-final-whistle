class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_teams

  def current_teams
  	Team.all
  end
end
