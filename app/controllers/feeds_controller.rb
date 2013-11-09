class FeedsController < ApplicationController

  def index
    @feeds = {}
    Feed.all.each do |f|
      begin
        # content = parse_feed(f.url,
        #                      f.item_node_name,
        #                      f.tags)
        content = []
      rescue
        puts "here in rescue"
        content = []
      end
      @feeds[f] = content if content.any?
    end
    render :action => "index"
  end

  def show
    f = Feed.find(params[:id])
    @feed = f
    @content = parse_feed(f.url,
                          f.item_node_name,
                          f.tags)
    render :action => "show", :layout => false
  end

  private

  def feed_params
    params.require(:feed).permit(:id, :name, :source_url, tags_attributes: [:name])
  end

  def parse_feed(url, item_node_name, tags)
    result = []
    doc = Nokogiri::XML(open(url))
    items = doc.xpath("//#{item_node_name}").to_a
    items.each do |i|
      item = {}
      tags.each do |t|
        node_set = i.xpath(".//#{t.node_name}")
        node_set = [] if node_set.nil?
        if t.get_node_cont?
          val = node_set.to_a.collect{ |n| clean(t.name, n.content) }
        elsif t.get_node_att?
          val = node_set.to_a.collect{ |n| n[t.att_name] }
        else
          val = []
        end
        item[t.name] = val
      end
      result << item
    end
    result
  end

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
