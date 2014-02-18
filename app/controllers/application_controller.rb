class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :logged_in?

  def logged_in?
    if session[:current_user]
      @logged_in = true
    else
      @logged_in = false
    end
    theme_set = Theme.find(rand(1..12))
    @theme = Bg.set_of_three(theme_set.main_bg,
                              theme_set.accent_a,
                              theme_set.accent_b)
    session[:current_lang] = 1
  end
  
end
