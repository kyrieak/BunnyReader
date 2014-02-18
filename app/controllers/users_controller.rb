class UsersController < ApplicationController

  def edit
    @bg_options = Bg.options
    @user = User.find(params[:id])
    if (@user.bg)
      @bg_label = @user.bg.label
    else
      @bg_label = "c9e0f4"
    end
    render "user_settings"
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    @user.save
  end

  def user_account
    pass_confirm = (user_params[:pass] == user_params[:pass_confirm])

    @user = User.new(email: user_params[:email],
                     pass: user_params[:pass],
                     pass_confirm: pass_confirm)
    
    if @user.save
      flash[:notice] = "Saved, success!"
    else
      flash[:notice] = "Did not save :( try again?"
    end

    redirect_to :back
  end

  def user_params
    params.require(:user).permit(:name, :email, :pass, :pass_confirm, :lang_id, bg: [:label])
  end

end