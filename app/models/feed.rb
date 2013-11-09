# class CreateFeeds < ActiveRecord::Migration
#   def change
#     create_table :feeds do |t|
#       t.string :url
#       t.string :name

#       t.timestamps
#     end
#   end
# end

require 'open-uri'

class Feed < ActiveRecord::Base

  has_many :tags
  accepts_nested_attributes_for :tags

end