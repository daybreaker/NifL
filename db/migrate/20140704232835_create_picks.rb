class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :winning_team_id
      t.integer :losing_team_id
      t.integer :winning_score
      t.integer :losing_score
      t.string :current_spread
      t.references :game, index: true
      t.references :user, index: true
      t.integer :made_before_week_id

      t.timestamps
    end
  end
end
