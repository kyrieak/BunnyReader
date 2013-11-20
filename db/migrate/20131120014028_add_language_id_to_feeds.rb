class AddLanguageIdToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :language_id, :integer
  end
end
