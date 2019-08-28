class ApplicationController < ActionController::Base
 private

  def require_user_logged_in
   #ログインしていない場合ログインページへと遷移させる
    unless logged_in?
      redirect_to login_url
    end
  end
end
