class ApplicationController < ActionController::Base
  include SessionsHelper
  def log_in(user)
      session[:user_id] = user.id
  end

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_guitarss = user.guitars.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_likes = user.likes.count
  end
end
