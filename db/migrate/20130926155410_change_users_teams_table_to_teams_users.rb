class ChangeUsersTeamsTableToTeamsUsers < ActiveRecord::Migration
  def change
  	rename_table :users_teams, :teams_users
  end
end
