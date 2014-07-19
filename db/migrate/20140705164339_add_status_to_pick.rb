class AddStatusToPick < ActiveRecord::Migration
  def change
    add_column :picks, :status, :string
  end
end
