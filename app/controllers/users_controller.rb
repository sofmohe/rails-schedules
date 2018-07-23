class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :delete, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login, :login_form]}

  def index
    @user = User.all.order("created_at DESC")
  end
  def show
    @user = User.find_by(id: params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(name: params[:name], nickname: params[:nickname], email: params[:email], memo: params[:memo], password: params[:password], image_name: "default.jpg")
    if @user.save
      session[:user_id] = @user.id
      session[:nickname] = @user.nickname
      if params[:image]
        @user.image_name = "#{@user.id}.jpg"
        File.binwrite("public/user_images/#{@user.image_name}", params[:image].read)
        @user.save
      end
      flash[:notice] = "メンバー登録が完了！"
      redirect_to("/users/index")
    else
      render("users/new")
    end
  end
  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.nickname = params[:nickname]
    @user.email = params[:email]
    @user.password = params[:password]    
    @user.memo = params[:memo]
    if @user.save
      if params[:image]
        @user.image_name = "#{@user.id}.jpg"
        File.binwrite("public/user_images/#{@user.image_name}", params[:image].read)
        @user.save
      end
      flash[:notice] = "メンバー情報の変更が完了！"
      redirect_to("/users/#{@user.id}/show")
    else
      render("users/#{@user.id}/edit")
    end
  end
  def delete
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to("/users/index")
  end
  def login_form
  end
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      session[:nickname] = @user.nickname
      flash[:notice] = "ログインしました！"
      redirect_to("/events/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています！"
      @email = params[:email]
      @password = params[:password]
      render("users/login")
    end
  end
  def logout
    session[:user_id] = nil
    session[:nickname] = nil
    flash[:notice] = "ログアウトしました！"
    redirect_to("/users/login")
  end
end
