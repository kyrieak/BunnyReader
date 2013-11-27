class CreateDefaults < ActiveRecord::Migration
  def change
    create_table :defaults do |t|
      t.integer :user_id
      t.integer :language_id
      t.integer :bg_id
      t.boolean :shuffle

      t.timestamps
    end
  end
end
