class RemoveCityFromTeamsTable < ActiveRecord::Migration
  def up
  	remove_column :teams, :city
  end

  def down
  	add_column :teams, :city, :string
  end
end
