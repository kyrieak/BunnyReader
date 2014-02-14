class UsersController < ApplicationController

  def edit
    @bg_options = Bg.options.sort{ |opt_a, opt_b| opt_b[0] <=> opt_a[0] }
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

  def user_params
    params.require(:user).permit(:name, :email, :lang_id, bg: [:label])
  end

end