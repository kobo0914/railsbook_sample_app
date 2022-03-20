class LoginController < ApplicationController
  def index
    @msg = 'これからログインします。'
  end

  def auth
    usr = User.find_by(username: params[:username])
    if usr && usr.authenticate(params[:password]) then
      reset_session
      session[:usr] = usr.id
      redirect_to params[:referer]
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザ名／パスワードが間違っています。'
      logger.debug('@errorをセットしました。')
      render action: :index
    end
    
  end

end
