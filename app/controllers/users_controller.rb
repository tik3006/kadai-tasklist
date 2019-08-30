class UsersController < ApplicationController
  before_action :require_user_logged_in,only: [:index, :show]
  

  def index
    #ユーザーを降順で取得する
    @users = User.order(id: :desc).page(params[:page])
  end

  def show
    #ユーザ情報を取得して表示する
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

   def create
    @user = User.new(user_params)
  
  #ユーザー登録に成功した場合
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
  #ユーザー登録に失敗した場合  
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
   end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
