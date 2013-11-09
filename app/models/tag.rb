# class CreateTags < ActiveRecord::Migration
#   def change
#     create_table :tags do |t|
#       t.integer :feed_id
#       t.string :name
#       t.string :node_name
#       t.string :att_name
#       t.boolean :get_node_att
#       t.boolean :get_node_cont
#       t.timestamps
#     end
#   end
# end

class Tag < ActiveRecord::Base

  belongs_to :feed

  def get_node_att?
    self.get_node_att
  end

  def get_node_cont?
    self.get_node_cont
  end

end