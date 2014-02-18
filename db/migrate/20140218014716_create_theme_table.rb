class CreateThemeTable < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.integer :main_bg
      t.integer :accent_a
      t.integer :accent_b
    end
  end
end
