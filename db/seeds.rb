
# ## Slate ##############################################################

# f = Feed.create({ :url => "http://feeds.slate.com/slate",
#                   :name => "Slate",
#                   :item_node_name => "item" })

# t = f.tags.build({ :name => "Title",
#                    :node_name => "title",
#                    :get_node_att => false,
#                    :get_node_cont => true })
# t.save

# t = f.tags.build({ :name => "Link",
#                    :node_name => "link",
#                    :get_node_att => false,
#                    :get_node_cont => true })

# t.save

# t = f.tags.build({ :name => "Author",
#                    :node_name => "dc:creator",
#                    :get_node_att => false,
#                    :get_node_cont => true })

# t.save

# t = f.tags.build({ :name => "Description",
#                    :node_name => "description",
#                    :get_node_att => false,
#                    :get_node_cont => true })

# t.save

# t = f.tags.build({ :name => "Image",
#                    :node_name => "media:thumbnail",
#                    :att_name => "url",
#                    :get_node_att => true,
#                    :get_node_cont => false })

# t.save

# ## NPR ################################################################

# f = Feed.create({ :url => "http://www.npr.org/rss/rss.php?id=1007",
#                   :name => "NPR",
#                   :item_node_name => "item" })

# t = f.tags.build({ :name => "Title",
#                    :node_name => "title",
#                    :get_node_att => false,
#                    :get_node_cont => true })

# t.save

# t = f.tags.build({ :name => "Link",
#                    :node_name => "link",
#                    :get_node_att => false,
#                    :get_node_cont => true })

# t.save

# t = f.tags.build({ :name => "Description",
#                    :node_name => "description",
#                    :get_node_att => false,
#                    :get_node_cont => true })

# t.save