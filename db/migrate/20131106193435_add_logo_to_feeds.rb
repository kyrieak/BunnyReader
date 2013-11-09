class AddLogoToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :logo, :string
  end
end
