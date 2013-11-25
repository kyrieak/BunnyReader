def seed_slate

  ### Slate ##############################################################

  f = Feed.new_eng('Slate',
                   'http://feeds.slate.com/slate',
                   'logo_slate.png')

  f.save

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

end