class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :logged_in?
  before_action :get_theme
          
  def logged_in?
    if session[:current_user]
      @logged_in = true
    else
      @logged_in = false
    end
    session[:current_lang] = 1
  end

  def get_theme   
    if (!session[:th_index] || session[:th_index] > 16)
      session[:th_index] = 0
    else
      session[:th_index] += 1
    end

    if (!session[:thid_order])
      thids = []
      bgs = Bg.all.to_a.sort_by{ |b| b.hue }.collect{ |bg| bg.id }
      themes = Theme.all.to_a.sort_by{ |t| bgs.find_index(t.bg_base) }.collect{ |th| th.id }
      themes = themes.join(",")
      session[:thid_order] = themes
    end
    
    order = session[:thid_order].split(",").collect{ |num| num.to_i }
    thid = order[session[:th_index]]
    t = Theme.find(thid)
    @thid = thid
    @theme = t.theme_set(Bg.find(t.bg_base).label, Bg.find(t.bg_pop).label)
    # @thid = 5
    # t = Theme.find(@thid)
    # @theme = t.theme_set(Bg.find(t.bg_base).label, Bg.find(t.bg_pop).label)
  end
  
end
