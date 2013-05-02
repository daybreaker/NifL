class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :number
      t.references :season

      t.timestamps
    end
  end
end
