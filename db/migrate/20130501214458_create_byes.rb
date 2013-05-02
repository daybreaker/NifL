class CreateByes < ActiveRecord::Migration
  def change
    create_table :byes do |t|
      t.references :season
      t.references :week
      t.references :team

      t.timestamps
    end
  end
end
