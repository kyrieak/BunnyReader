require 'open-uri'

class Feed < ActiveRecord::Base

  has_many :tags
  accepts_nested_attributes_for :tags

  def self.new_jp(name, url, logo, item_nn="item")
    return Feed.new(name: name,
                    url: url,
                    item_node_name: item_nn,
                    logo: logo,
                    language_id: 2)
  end

  def self.new_eng(name, url, logo, item_nn="item")
    return Feed.new(name: name,
                    url: url,
                    item_node_name: item_nn,
                    logo: logo,
                    language_id: 1)
  end

end