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
    order = [1, 3, 4, 5, 6, 9, 13, 16, 17, 18, 21, 25, 27]

    if (!session[:th_index] || session[:th_index] > 12)
      session[:th_index] = 0
    end
    
    thid = order[session[:th_index]]
    t = Theme.find(thid)
    @thid = thid
    @theme = t.theme_set(Bg.find(t.bg_base).label, Bg.find(t.bg_pop).label)
    session[:th_index] += 1
  end
  
end
