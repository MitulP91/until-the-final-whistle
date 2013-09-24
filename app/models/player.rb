class Player < ActiveRecord::Base
  attr_accessible :age, :name, :nationality, :position, :team_id

  belongs_to :team
  has_one :league, :through => :team
end
