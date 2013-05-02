class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :city
      t.string :mascot
      t.string :abbr

      t.timestamps
    end
  end
end
