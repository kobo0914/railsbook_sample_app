class CtrController < ApplicationController
  before_action :start_logger
  before_action :auth, only: :index
  after_action :end_logger

  def para
    send_file '/Users/koborihirotaka/Downloads/42a65079052405b88f58f260257b6c72.png', type: 'image/jpeg', disposition: :inline
  end

  def get_xml
    @books = Book.all
    render json: @books
  end

  def cookie
    @email = cookies[:email]
  end

  def cookie_rec
    cookies[:email] = { value: params[:email], expires: 3.months.from_now, http_only: true }
    render plain: 'クッキーを保存しました'
  end

  def index
    render plain: 'indexアクション'
  end

  private
    def start_logger
      logger.debug('[Start] ' + Time.now.to_s)
    end

    def end_logger
      logger.debug('[Finish] ' + Time.now.to_s)
    end

    def auth
      name = 'yyamada'
      passwd = "8cb2237d0679ca88db6464eac60da96345513964"

      authenticate_or_request_with_http_basic('Railsbook') do |n, p|
        n == name && Digest::SHA1.hexdigest(p) == passwd
      end
    end

end
