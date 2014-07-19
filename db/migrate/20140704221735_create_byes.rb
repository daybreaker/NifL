class CreateByes < ActiveRecord::Migration
  def change
    create_table :byes do |t|
      t.references :week, index: true
      t.references :team, index: true

      t.timestamps
    end
  end
end
