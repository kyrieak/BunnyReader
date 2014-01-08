class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :pass
      t.string :pass_confirm
      
      t.integer :lang_id
      t.integer :bg_id
      t.boolean :shuffle

      t.timestamps
    end
  end
end