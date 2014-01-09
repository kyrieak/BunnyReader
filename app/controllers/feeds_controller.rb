require 'curler'

class FeedsController < ApplicationController

  # respond_to :json

  def index
    @bg_url = Bg.find(rand(1..9)).name
    @language = session[:current_lang]
    @feeds = [Feed.all.where(language_id: @language).to_a[0]]
    shuffle = true
    @items = Curler.new(@feeds).items(shuffle)
    puts @items

    render :action => "index"
  end
  
# =================================================================================

  private

  def feed_params
    params.require(:feed).permit(:id, :name, :url, :logo, :language_id, tags_attributes: [:name, :node_name])
    params.require(:user).permit(:name, :email,
                                  defaults: [:language_id, bg:[:name]])
  end  

end
