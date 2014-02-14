class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :author
      t.string :source_url
      t.string :main_source_name
      t.string :main_source_url

      t.timestamps
    end
  end
end
