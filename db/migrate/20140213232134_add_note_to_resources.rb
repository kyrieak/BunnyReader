class AddNoteToResources < ActiveRecord::Migration
  def up
    add_column :resources, :note, :string
  end

  def down
    remove_column :resources, :note
  end
end
