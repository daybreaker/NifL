class CreatePickset < ActiveRecord::Migration
  def change
    create_table :picksets do |t|
      t.references :season, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
