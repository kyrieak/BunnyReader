class SessionsController < ApplicationController

  def login_with_omni
    auth = request.env["omniauth.auth"]

    @auth_opt = AuthOption.find_or_create(auth[:provider],
                                          auth[:uid])
    @user = User.find_or_create(@auth_opt.user_id,
                                auth[:info][:first_name])

    set_currents(@user.id, @user.lang)

    redirect_to root_url, :notice => "Hi #{@user.name} :)"
  end

  
  def login_with_email
    @user = User.find_by_email(params[:email],
                               params[:pass])
    
    if @user.nil?
      flash[:notice] = "Login Failed. Create account?"
    else
      set_currents(@user.id, @user.lang)
    end

    redirect_to root_url, :notice => "Hi #{@user.name} :)"
  end


  def login_as_guest
    set_currents("Guest")

    redirect_to root_url, :notice => "Hi there :)"
  end

  
  def destroy
    set_currents(nil, nil)

    redirect_to root_url, :notice => "Logged out :)"
  end

# ---------------------------------------------------------------------

  private

  def session_params
    params.require(:user).permit(:name, :email, :pass, :pass_confirm,
                                 auth_options: [:provider, :uid, :name])
  end

  def set_currents(user, lang=1)
    session[:current_user] = user
    session[:current_lang] = lang
  end

end