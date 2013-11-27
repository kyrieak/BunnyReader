class RenamePasswordToPass < ActiveRecord::Migration
  def up
    add_column :users, :pass, :string
  end

  def down
    remove_column :users, :pass
  end
end
