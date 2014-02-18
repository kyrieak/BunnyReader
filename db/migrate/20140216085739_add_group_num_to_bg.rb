class AddGroupNumToBg < ActiveRecord::Migration
  def up
    add_column :bgs, :order, :integer
  end

  def down
    remove_column :bgs, :order
  end
end
