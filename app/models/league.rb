class League < ActiveRecord::Base
  attr_accessible :country, :name

  has_many :teams
  has_many :players, :through => :teams
end
