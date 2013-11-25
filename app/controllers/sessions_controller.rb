class SessionsController < ApplicationController

  # before_action :require_login

  # -- login ----------------------------------------------------

  def login_with_omni
    auth = request.env["omniauth.auth"]

    @user = get_omni_user(auth)
    session[:current_user] = @user.id
    session[:current_language] = get_lang(:english)

    redirect_to root_url, :notice => "Hi #{@user.name} :)"
  end


  def login_with_email
    @user = find_user_by_email(params[:email], params[:password])
    
    if @user.nil?
      flash[:notice] = "Login Failed. Create account?"
    else
      session[:current_user] = @user.id
      session[:current_lang] = get_lang(:english)

      redirect_to root_url, :notice => "Hi #{@user.name} :)"
    end
  end


  def login_as_guest
    session[:current_user] = "Guest"
    session[:current_lang] = get_lang(:english)
    
    redirect_to root_url, :notice => "Hi there :)"
  end


  # -- email account -------------------------------------------

  def email_account
    @user = create_user_from_email(params[:email],
                                   params[:password],
                                   params[:password_confirm])
  end

  # -- logout ----------------------------------------------------

  def destroy
    session[:current_user] = nil

    redirect_to root_url, :notice => "Logged out :)"
  end


# ================================================================

  private

  def session_params
    params.require(:user).permit(:name, :email, auth_options: [:provider, :uid, :name])
  end


  def get_omni_user(auth)
    user = find_user_by_omni(auth)
    user = create_user_from_omni(auth) if user.nil?

    return user
  end


  def get_lang(lang)
    if lang == :japanese
      return 2
    elsif lang == :english
      return 1
    end
  end

  # -- find user -------------------------------------------------

  def find_user_by_omni(auth)
    auth_opt = AuthOption.where(provider: auth["provider"],
                                uid: auth["uid"]).first
    if auth_opt.nil?
      user = nil
    else
      user = auth_opt.user
    end

    return user
  end


  def find_user_by_email(email, pass)
    user = User.where(email: email, password: pass).first

    return user
  end


  # -- create account --------------------------------------------

  def create_user_from_omni(auth)
    user = User.new(name: auth["info"]["first_name"])
    
    if user.save
      auth_opt = user.auth_options.build(provider: auth["provider"],
                                         uid: auth["uid"])
      auth_opt.save
    end

    return user
  end


  def create_user_from_email(email, pass, pass_confirm)
    user = User.create(email: email,
                       password: pass,
                       password_confirm: pass_confirm)
    return user
  end

end