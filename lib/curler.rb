class Curler

  @@hydra = Typhoeus::Hydra.new(max_concurrency: 6)

  def initialize(feed_tags)
    @feed_tags = feed_tags
    #@responses = Hash.new("")
    @items = []
    add_feeds_to_queue(@feed_tags.keys)
  end

  def items(shuffle = false)
    puts "------------------------------------------------------------------------"
    t1 = Time.now
    @@hydra.run
    t2 = Time.now
    puts (t2 - t1)
    puts "------------------------------------------------------------------------"
    shuffle ? @items.shuffle : @items
  end

  private

  def add_feeds_to_queue(feeds)
    feeds.each{ |f| add_queue(f) }
  end

  def add_queue(feed)
    @@hydra.queue new_request(feed)
  end

  # -------------------------------------------------------------------------------

  def new_request(feed)
    request = Typhoeus::Request.new(feed.url)

    #request.on_body{ |chunk| @responses[feed] << chunk }

    request.on_complete do |resp|
      if resp.success?
        parse_feed(feed, resp.body)
        puts ("response - success :)")
        # log("response - success :)")
      elsif resp.timed_out?
        puts ("response - timed out :(")
        # log("response - timed out :(")
      elsif resp.code == 0
        puts ("response code 0: " << resp.return_message)
        # log("response code 0: " << response.return_message)
      else
        puts ("response - failed: " << resp.code.to_s)
        # log("response - failed: " << response.code.to_s)
      end
    end
    return request
  end

  # -------------------------------------------------------------------------------

  def parse_feed(feed, response) 
    doc = Nokogiri::XML(response)
    item_nodes = doc.xpath("//#{feed.item_node_name}").to_a
    tags = @feed_tags[feed]

    item_nodes.each do |i|
      item = {}
      tags.each{ |t| item[t.name] = tag_val(t, i) }
      
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
    val.delete("")

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
         i = clean_str[0..480].rindex(' ')
         clean_str = clean_str[0...i] if i
      end
    end

    clean_str
  end

end