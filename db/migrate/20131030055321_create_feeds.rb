class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :language_id
      t.string :url
      t.string :name
      t.string :item_node_name
      t.string :logo

      t.timestamps
    end
  end
end
