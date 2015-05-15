class AddPicksetToPick < ActiveRecord::Migration
  def change
    add_reference :picks, :pickset, index: true, foreign_key: true
  end
end
