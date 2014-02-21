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
    if (!session[:thid] || session[:thid] > 17)
      session[:thid] = 1
    else
      session[:thid] += 1
    end
    t = Theme.find(session[:thid])
    @thid = session[:thid]
    @theme = t.theme_set(Bg.find(t.bg_base).label, Bg.find(t.bg_pop).label)
  end
  
end
