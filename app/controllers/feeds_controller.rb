require 'itemizer'

class FeedsController < ApplicationController

  respond_to :json

  def index
    @language = session[:current_lang]
    @feed_ids = Feed.all.where(language_id: @language).to_a.collect{ |f| f.id }

    respond_with @feed_ids
  end

  # def index
  #   @items = []
  #   @language = session[:current_lang]
  #   feed_list = Feed.all.where(language_id: @language)

  #   feed_list.each do |f|
  #     f_items = Itemizer.new(f, 2).items_with_feed
  #     (@items += f_items) if f_items.any?
  #   end

  #   @items.shuffle!
  #   puts @feeds
  #   puts "------------------------------------------------"

  #   render :action => "index", :layout => false
  # end



  # -------------------------------------------------------------------------------

  def show
    @feed = Feed.find(params[:id])
    @items = Itemizer.new(@feed, 2).items_with_feed
    
    render :action => "show", :layout => false
  end
  
  # def show
  #   f = Feed.find(params[:id])
  #   @feed = f
  #   @content = parse_feed(f.url,
  #                         f.item_node_name,
  #                         f.tags)
  #   render :action => "show", :layout => false
  # end


# =================================================================================

  private

  def feed_params
    params.require(:feed).permit(:id, :name, :url, :logo, :language_id, tags_attributes: [:name, :node_name])
    params.require(:user).permit(:name, :email,
                                  defaults: [:language_id, bg:[:name]])
  end  

end
