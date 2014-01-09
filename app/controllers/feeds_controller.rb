require 'curler'

class FeedsController < ApplicationController

  def index
    @bg_url = Bg.find(rand(1..9)).name
    @language = session[:current_lang]
    feed_tags = {}
    Feed.all.where(language_id: @language).each{ |f| feed_tags[f] = f.tags.to_a }
    shuffle = true
    @items = Curler.new(feed_tags).items(shuffle)
    
    if @language == 2
      render "index_jp", :layout => "app_jp"
    else
      render :action => "index"
    end
  end
  
# =================================================================================

  private

  def feed_params
    params.require(:feed).permit(:id)
    params.require(:user).permit(:name, :email, :lang_id, bg:[:name])
  end  

end
