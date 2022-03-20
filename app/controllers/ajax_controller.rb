class AjaxController < ApplicationController
  def index
  end

  def upanel
    @time = Time.now.to_s
    respond_to do |format|
      format.js 
      format.html { render plain: 'HTML形式のリクエストです。' } 
    end
  end

  def search
    @books = Book.select(:publish).distinct
  end
  
  def result
    @books = Book.where(publish: params[:publish])
    respond_to do |format|
      format.js
      format.html { render plain: 'HTML形式のリクエストです。' }
    end
  end

end
