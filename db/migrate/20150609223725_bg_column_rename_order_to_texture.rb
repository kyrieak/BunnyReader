class BgColumnRenameOrderToTexture < ActiveRecord::Migration
  def up
    rename_column :bgs, :order, :texture
  end

  def down
    remove_column :bgs, :texture, :order
  end
end
