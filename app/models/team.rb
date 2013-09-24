class Team < ActiveRecord::Base
  attr_accessible :city, :league_id, :name, :place_last_year

  belongs_to :league
  has_many :players
end