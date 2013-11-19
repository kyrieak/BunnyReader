f = Feed.new(name: 'MSN産経ニュース - 注目',
			 url: 'http://sankei.jp.msn.com/rss/news/points.xml',
			 item_node_name: 'item',
			 logo: 'logo_msn_sankei.png')
f.save

t = f.tags.build(name: 'Title',
				 node_name: 'title',
				 get_node_att: false,
				 get_node_cont: true)

t.save

t = f.tags.build(name: 'Link',
				 node_name: 'link',
				 get_node_att: false,
				 get_node_cont: true)


t.save

t = f.tags.build(name: 'Description',
				 node_name: 'description',
				 get_node_att: false,
				 get_node_cont: true)

t = f.tags.build(name: 'Image',
				 node_name: 'media:content',
				 att_name: 'url',
				 get_node_att: true,
				 get_node_cont: false)

t.save

f.save