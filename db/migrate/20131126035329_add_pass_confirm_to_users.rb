class AddPassConfirmToUsers < ActiveRecord::Migration
  def up
    add_column :users, :pass_confirm, :boolean
  end


  def down
    remove_column :users, :pass_confirm
  end
  
end
