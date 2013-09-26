class AddBioToPlayersTable < ActiveRecord::Migration
  def change
  	add_column :players, :bio, :text
  end
end