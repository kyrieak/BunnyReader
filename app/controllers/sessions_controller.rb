class SessionsController < ApplicationController

  # before_action :require_login

  # -- login ----------------------------------------------------

  def login_with_omni
    auth = request.env["omniauth.auth"]
    @user = find_user_by_omni(auth)
    @user = create_user_from_omni(auth) if @user.nil?
    session[:current_user] = @user.id

    redirect_to root_url, :notice => "Hi #{@user.name} :)"
  end

  def login_with_email
    @user = find_user_by_email(params[:email], params[:password])
    if @user.nil?
      flash[:notice] => "Login Failed. Create account?"
    else
      session[:current_user] = @user.id
      redirect_to root_url, :notice => "Hi #{@user.name} :)"
    end
  end

  def login_as_guest
    session[:current_user] = "Guest"
    redirect_to root_url, :notice => "Hi there :)"
  end

  # -- email account -------------------------------------------

  def email_account
    args = [params[:email], params[:password], params[:password_confirm]]
    @user = create_user_from_email(*args)
  end

  # -- logout ----------------------------------------------------

  def destroy
    session[:current_user] = nil
    redirect_to root_url, :notice => "Logged out :)"
  end

  private

  def session_params
    params.require(:user).permit(:email, :password, :password_confirm)
  end
    
  end

  # -- find user -------------------------------------------------

  def find_user_by_omni(auth)
    User.where(provider: auth["provider"],
               uid: auth["uid"],
               name: auth["info"]["first_name"]).first
  end

  def find_user_by_email(email, pass)
    User.where(email: email, password: pass).first
  end

  # -- create account --------------------------------------------

  def create_user_from_omni(auth)
    User.create(provider: auth["provider"],
                uid: auth["uid"],
                name: auth["info"]["first_name"])
  end

  def create_user_from_email(email, pass, pass_confirm)
    User.create(email: email, password: pass)
  end

end