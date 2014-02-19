class ModifyThemeColumns < ActiveRecord::Migration
  def up
    remove_column :themes, :accent_b
    add_column :themes, :color_base, :string
    add_column :themes, :color_pop, :string
    rename_column :themes, :main_bg, :bg_base
    rename_column :themes, :accent_a, :bg_pop
  end

  def down
    rename_column :themes, :bg_pop, :accent_a
    rename_column :themes, :bg_base, :main_bg
    remove_column :themes, :color_pop
    remove_column :themes, :color_pop
    add_column :themes, :accent_b, :integer
  end
end
