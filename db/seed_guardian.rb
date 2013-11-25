def seed_guardian

  ### NYT ##############################################################

  f = Feed.new_eng('The Guardian',
                   'http://feeds.theguardian.com/theguardian/uk/rss',
                   'logo_guardian.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  t = f.tags.build(Tag.default_author_args('dc:creator'))
  t.save

  f.save

end