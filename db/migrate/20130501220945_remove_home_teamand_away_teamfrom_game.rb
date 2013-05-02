class RemoveHomeTeamandAwayTeamfromGame < ActiveRecord::Migration
  def up
    remove_column :games, :home_team
    remove_column :games, :away_team
  end

  def down
    add_column :games, :home_team
    add_column :games, :away_team
  end
end
