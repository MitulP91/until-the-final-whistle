class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :nationality
      t.string :position
      t.integer :team_id

      t.timestamps
    end
  end
end
