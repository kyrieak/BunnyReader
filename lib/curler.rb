class Curler

  @@m_curl = Curl::Multi.new

  def initialize(feed_tags)
    @feed_tags = feed_tags
    @@m_curl.pipeline = true
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
    @feed_tags.each_key do |feed|
      url = feed.url
      @responses[feed] = ""
      
      e_curl = Curl::Easy.new(url) do |curl|
        curl.follow_location = true
        curl.on_body do |data|
          @responses[feed] << data
          data.size
        end
        curl.on_success do |easy|
          puts "success, add more easy handles."
        end
      end

      @@m_curl.add(e_curl)
    end

  end

  # -------------------------------------------------------------------------------

  def m_perform
    m_setup

    tp = Time.now

    @@m_curl.perform do
      # puts "idling... can do some work here"
    end

    te = Time.now
    puts "perform time #{te - tp}"
    puts "-------------------------------------------------------------------------------"

    @responses.each do |feed, response|
      t1 = Time.now
      parse_feed(feed, response)
      t2 = Time.now
      puts "parse time: #{t2 - t1}"
      puts "-------------------------------------------------------------------------------"
    end

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
         len = clean_str.length
         i = clean_str[0..480].rindex(' ')
         clean_str = clean_str[0...i] if i
      end
    end

    clean_str
  end

end