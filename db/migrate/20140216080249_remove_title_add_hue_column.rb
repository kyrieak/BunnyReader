class RemoveTitleAddHueColumn < ActiveRecord::Migration
  def up
    remove_column :bgs, :title
    add_column :bgs, :hue, :integer
  end

  def down
    remove_column :bgs, :hue
    add_column :bgs, :title, :string
  end
end
