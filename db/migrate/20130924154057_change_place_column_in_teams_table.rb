class ChangePlaceColumnInTeamsTable < ActiveRecord::Migration
  def change
  	rename_column :teams, :place_last_year, :current_place
  end
end
