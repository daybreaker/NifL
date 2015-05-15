class AddNameToPickset < ActiveRecord::Migration
  def change
    add_column :picksets, :name, :string
  end
end
