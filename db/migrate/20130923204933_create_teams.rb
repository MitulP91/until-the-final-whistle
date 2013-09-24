class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.integer :place_last_year
      t.integer :league_id

      t.timestamps
    end
  end
end
