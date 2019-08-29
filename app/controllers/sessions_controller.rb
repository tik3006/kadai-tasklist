class SessionsController < ApplicationController
  def new
  end

  def create
   #フォームデータの取得
    email = params[:session][:email].downcase
    password = params[:session][:password]
    
    
    #ログインが成功しているかを判定する
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    #ユーザー情報を削除する
    session[:user_id] = nil
    flash[:success] = 'logout'
    redirect_to  root_url
  end

  private

  def login(email, password)
   
   #Emailからユーザー情報を取得
    @user = User.find_by(email: email)
    
    #ユーザー情報とパスワードが一致するかを判定する
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
