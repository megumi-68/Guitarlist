class ToppagesController < ApplicationController
  def index
     if logged_in?
      @guitar = current_user.guitars.build
      @guitars = current_user.feed_guitars.order(id: :desc).page(params[:page])
     end
  end
end



