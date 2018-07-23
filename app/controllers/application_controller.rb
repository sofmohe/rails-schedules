class ApplicationController < ActionController::Base	
  before_action :set_current_user
  protect_from_forgery with: :exception
  def set_current_user
  	@current_user = User.find_by(id: session[:user_id])
  end
  def authenticate_user
  	if @current_user == nil
  		flash[:notice] = "ログインしてください！"
  		redirect_to("/users/login")
  	end
  end
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでに" + @current_user.nickname + "としてログイン済みです！"
    end
  end
end
