class CreateAuthOptions < ActiveRecord::Migration
  def change
    create_table :auth_options do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
