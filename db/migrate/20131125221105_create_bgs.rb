class CreateBgs < ActiveRecord::Migration
  def change
    create_table :bgs do |t|
      t.string :name
      t.integer :color_key

      t.timestamps
    end
  end
end
