class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_team_id
      t.string :home_team
      t.integer :away_team_id
      t.string :away_team
      t.string :spread
      t.references :pick
      t.references :week

      t.timestamps
    end
  end
end
