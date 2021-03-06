class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    guitar = Guitar.find(params[:guitar_id])
    current_user.like(guitar)
    flash[:success] = 'お気に入りしました。'
    redirect_to root_path
  end

  def destroy
    guitar = Guitar.find(params[:guitar_id])
    current_user.unlike(guitar)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_path
  end
end
