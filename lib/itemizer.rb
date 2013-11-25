class Itemizer

  def initialize(feed)
    @feed = feed
    @items = parse_feed(@feed)
  end


  def items_with_feed
    @items.collect{ |i| { feed_id: @feed.id, logo: @feed.logo, item: i } }
  end

  private

  # -------------------------------------------------------------------------------

  def parse_feed(feed)
    result = []
    doc = Nokogiri::XML(open(feed.url))
    items = doc.xpath("//#{feed.item_node_name}").to_a
    
    items.each do |i|
      item = {}
      feed.tags.each{ |t| item[t.name] = tag_val(t, i) }
      result << item
    end
    result
  end

  # -------------------------------------------------------------------------------

  def tag_val(tag, item_node)
    node_set = item_node.xpath(".//#{tag.node_name}").to_a
    node_set = [] if node_set.nil?

    if tag.get_node_cont?
      val = node_set.to_a.collect{ |n| clean(tag.name, n.content) }
    elsif tag.get_node_att?
      val = node_set.to_a.collect{ |n| n[tag.att_name] }
    else
      val = []
    end

    return val
  end

  # -------------------------------------------------------------------------------

  def clean(t_name, str)
    if (t_name == "Link")
      clean_str = str
    else
      clean_str = str.chomp.gsub('&lt;', '<')
                           .gsub('&gt;', '>')
                           .gsub('&amp;', '&')
                           .gsub('&nbsp;', ' ')
                           .gsub('&quot;', '"')
                           .gsub(/(\<[^\<\>]+\>)/, ' ')
      
      if t_name == "Description" && clean_str.length > 480
         len = clean_str.length
         i = clean_str[0..480].rindex(' ')
         clean_str = clean_str[0...i] if i
      end
    end

    clean_str
  end


  # def parse_feed(url, item_node_name, tags)
  #   result = []
  #   doc = Nokogiri::XML(open(url))
  #   items = doc.xpath("//#{item_node_name}").to_a
    
  #   items.each do |i|
  #     item = {}
  #     tags.each{ |t| item[t.name] = tag_val(t, i) }
  #     result << item
  #   end
  #   result
  # end

  # -------------------------------------------------------------------------------

  # def index
  #   @feeds = {}
  #   @language = session[:current_lang]
  #   @language = 1
  #   feed_list = Feed.all.where(language_id: @language)

  #   feed_list.each do |f|
  #     puts f.tags
  #     begin
  #       content = parse_feed(f.url, f.item_node_name, f.tags)
  #     rescue
  #       content = []
  #     end
  #     @feeds[f] = content if content.any?
  #   end

  #   render :action => "index"
  # end

end