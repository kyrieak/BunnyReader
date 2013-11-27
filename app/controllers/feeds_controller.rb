require 'itemizer'

class FeedsController < ApplicationController

  def index
    @items = []
    @language = session[:current_lang]
    @language = 1
    feed_list = Feed.all.where(language_id: @language)
    puts feed_list
    feed_list.each do |f|
      f_items = Itemizer.new(f).items_with_feed
      (@items += f_items) if f_items.any?
    end

    @items.shuffle!
    puts @feeds
    puts "------------------------------------------------"

    render :action => "index"
  end



  # -------------------------------------------------------------------------------
  
  def show
    f = Feed.find(params[:id])
    @feed = f
    @content = parse_feed(f.url,
                          f.item_node_name,
                          f.tags)
    render :action => "show", :layout => false
  end


# =================================================================================

  private

  def feed_params
    params.require(:feed).permit(:id, :name, :url, :logo, :language_id, tags_attributes: [:name, :node_name])
    params.require(:user).permit(:name, :email,
                                  defaults: [:language_id, bg:[:name]])
  end  

end
