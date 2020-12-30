class ToppagesController < ApplicationController
  def index
     if logged_in?
      
      @guitars = current_user.guitars.order(id: :desc).page(params[:page])
     end
  end
end


