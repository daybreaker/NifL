class AddFieldsToPick < ActiveRecord::Migration
  def change
    add_column :picks, :game_id, :integer
    add_column :picks, :made_before_week, :integer
  end
end
