class AddTitleColumnToBg < ActiveRecord::Migration
  def up
    rename_column :bgs, :name, :title
    add_column :bgs, :label, :string
  end

  def down
    remove_column :bgs, :label
    rename_column :bgs, :title, :name
  end
end
