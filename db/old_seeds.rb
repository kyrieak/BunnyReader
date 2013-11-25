
# ## Slate ##############################################################

f = Feed.create(name: 'Slate',
                url: 'http://feeds.slate.com/slate',
                logo: 'logo_slate.png')

t = f.tags.build(Tag.default_title_args)
t.save

t = f.tags.build(Tag.default_link_args)
t.save

t = f.tags.build(Tag.default_desc_args)
t.save

t = f.tags.build(Tag.default_image_args('media:thumbnail'))
t.save

t = f.tags.build(Tag.default_author_args('dc:creator'))
t.save

f.save

# ## NPR ################################################################

# f = Feed.create(name: 'NPR',
#                 url: 'http://www.npr.org/rss/rss.php?id=1001',
#                 logo: 'logo_npr.png')

# t = f.tags.build(Tag.default_title_args)
# t.save

# t = f.tags.build(Tag.default_link_args)
# t.save

# t = f.tags.build(Tag.default_desc_args)
# t.save

# f.save