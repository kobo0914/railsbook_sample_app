class HelloController < ApplicationController
  before_action :check_logined, only: :view
  
  def index
    render plain: 'こんにちは、世界！'
  end

  def view
    @msg = 'こんにちは、世界！'
  end

  def list 
    @books = Book.all
  end

  def app_var
    render plain: MY_APP['author']
  end

  private
    def check_logined
      if session[:usr] then
        begin
          @usr = User.find(session[:usr])
        rescue ActiveRecord::RedcordNotFound
          reset_session
        end
      end

      unless @usr
        flash[:referer] = request.fullpath
        redirect_to controller: :login, action: :index
      end
    end

end
