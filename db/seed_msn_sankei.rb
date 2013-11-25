def seed_msn_sankei
  f = Feed.new_jp('MSN産経ニュース - 注目',
                  'http://sankei.jp.msn.com/rss/news/points.xml',
                  'logo_msn_sankei.png')
  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save

  # ------------------------------------------------------------------

  f = Feed.new_jp('MSN産経ニュース - 速報',
                  'http://sankei.jp.msn.com/rss/news/flash.xml',
                  'logo_msn_sankei.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save


  # ------------------------------------------------------------------

  f = Feed.new_jp('MSN産経ニュース - 事件',
                  'http://sankei.jp.msn.com/rss/news/affairs.xml',
                  'logo_msn_sankei.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save


  # ------------------------------------------------------------------

  f = Feed.new_jp('MSN産経ニュース - 政治',
                 'http://sankei.jp.msn.com/rss/news/politics.xml',
                 'logo_msn_sankei.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save


  # ------------------------------------------------------------------

  f = Feed.new_jp('MSN産経ニュース - 経済・IT',
                  'http://sankei.jp.msn.com/rss/news/economy.xml',
                  'logo_msn_sankei.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save


  # ------------------------------------------------------------------

  f = Feed.new_jp('MSN産経ニュース - 国際',
                  'http://sankei.jp.msn.com/rss/news/world.xml',
                  'logo_msn_sankei.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save


  # ------------------------------------------------------------------

  f = Feed.new_jp('MSN産経ニュース - スポーツ',
                  'http://sankei.jp.msn.com/rss/news/sports.xml',
                  'logo_msn_sankei.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save


  # ------------------------------------------------------------------

  f = Feed.new_jp('MSN産経ニュース - エンタメ',
                  'http://sankei.jp.msn.com/rss/news/entertainments.xml',
                  'logo_msn_sankei.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save


  # ------------------------------------------------------------------

  f = Feed.new_jp('MSN産経ニュース - ライフ',
                  'http://sankei.jp.msn.com/rss/news/life.xml',
                  'logo_msn_sankei.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save


  # ------------------------------------------------------------------

  f = Feed.new_jp('MSN産経ニュース - 科学',
                  'http://sankei.jp.msn.com/rss/news/science.xml',
                  'logo_msn_sankei.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save


  # ------------------------------------------------------------------

  f = Feed.new_jp('MSN産経ニュース - 地方',
                  'http://sankei.jp.msn.com/rss/news/region.xml',
                  'logo_msn_sankei.png')

  f.save

  t = f.tags.build(Tag.default_title_args)
  t.save

  t = f.tags.build(Tag.default_link_args)
  t.save

  t = f.tags.build(Tag.default_desc_args)
  t.save

  t = f.tags.build(Tag.default_image_args('media:content'))
  t.save

  f.save

end