class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :winning_team
      t.integer :losing_team
      t.integer :winning_score
      t.integer :losing_score
      t.string :current_spread
      t.references :user

      t.timestamps
    end
  end
end
