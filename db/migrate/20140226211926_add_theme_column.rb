class AddThemeColumn < ActiveRecord::Migration
  def up
    rename_column :themes, :color_base, :color_a
    rename_column :themes, :color_pop, :color_b
    add_column :themes, :color_c, :string
    add_column :themes, :color_d, :string
  end

  def down
    remove_column :themes, :color_d
    remove_column :themes, :color_c
    rename_column :themes, :color_b, :color_pop
    rename_column :themes, :color_a, :color_base
  end

end
