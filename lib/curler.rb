class Curler

  def initialize(feeds)
    @feeds = feeds
    @m_curl = Curl::Multi.new
    @responses = {}
    @items = []
  end

  def items(shuffle = false)
    m_perform
    shuffle ? @items.shuffle : @items
  end

  private

  def m_setup
    # add a few easy handles
    @feeds.each do |f|
      url = f.url
      @responses[f] = ""
      
      e_curl = Curl::Easy.new(url) do |curl|
        curl.follow_location = true
        curl.on_body do |data|
          @responses[f] << data
          data.size
        end
        curl.on_success do |easy|
          puts "success, add more easy handles."
        end
      end

      @m_curl.add(e_curl)
    end

  end

  # -------------------------------------------------------------------------------

  def m_perform
    m_setup

    tp = Time.now
    i = 0
    len = @feeds.length

    @m_curl.perform do
      puts "idling... can do some work here"
      if (i < len)
        feed = @feeds[i]
        if (@responses[feed])
          parse_feed(feed, @responses[feed])
          puts "herehereherehereherehereherehereherehereherehereherehere"
          puts "items? #{@items}"
          i += 1
        end
      end
    end
    te = Time.now
    puts "perform time #{te - tp}"
    puts "-------------------------------------------------------------------------------"

    # @responses.each do |feed, response|
    #   t1 = Time.now
    #   parse_feed(feed, response)
    #   t2 = Time.now
    #   puts "parse time: #{t2 - t1}"
    #   puts "-------------------------------------------------------------------------------"
    # end

  end

  # -------------------------------------------------------------------------------

  def parse_feed(feed, response) 
    doc = Nokogiri::XML(response)
    item_nodes = doc.xpath("//#{feed.item_node_name}").to_a
    
    item_nodes.each do |i|
      item = {}
      feed.tags.each{ |t| item[t.name] = tag_val(t, i) }
      
      item["Author"] = [feed.name] if item["Author"].nil?

      @items << { feed_id: feed.id, logo: feed.logo, item: item }
    end

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

end

f = Feed.all.where({ language_id: 2 })
curler = Curler.new(f)
curler.items.each do |i|
  puts i
  puts "---------------"
end