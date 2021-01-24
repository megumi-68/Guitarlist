class GuestSessionsController < ApplicationController
  skip_before_action :method_name, raise: false

  def create
    user = User.find_by(email: 'test@example.com')
    log_in(user)
    flash[:success] = 'ゲストユーザーでログインしました'
    redirect_to root_url
  end
end
