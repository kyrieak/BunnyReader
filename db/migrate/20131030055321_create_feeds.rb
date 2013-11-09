class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :url
      t.string :name
      t.string :item_node_name

      t.timestamps
    end
  end
end
