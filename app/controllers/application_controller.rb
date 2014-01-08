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
  end

  def home
    session[:current_lang] = 2
    @language = session[:current_lang]
    @bg_url = Bg.find(rand(1..9)).name

    render "layouts/application"
  end

end
