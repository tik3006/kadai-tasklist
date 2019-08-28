class UsersController < ApplicationController
  
  def index
    #ユーザーを降順で取得する
    @users = User.order(id: :desc).page(params[:page]).per(25)
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

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
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
